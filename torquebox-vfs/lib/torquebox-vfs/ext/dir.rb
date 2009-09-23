
class Dir

  class << self

    def open(str)
      result = dir = VFSDir.new( str )
      if block_given?
        begin
          result = yield( dir )
        ensure
          dir.close 
        end
      end
      result
    end

    def [](pattern)
      self.glob( pattern )
    end

    def glob(pattern,flags=nil)
      first_special = ( pattern =~ /[\*\?\[\{]/ )
      base    = pattern[0, first_special]
      matcher = pattern[first_special..-1]
      root = org.jboss.virtual.VFS.root( base )
      root.children_recursively( GlobFilter.new( matcher ) ).collect{|e| "#{base}#{e.path_name}"}
    end

  end

  class VFSDir
    attr_reader :path
    attr_reader :pos
    alias_method :tell, :pos

    def initialize(path)
      @path         = path
      @virtual_file = org.jboss.virtual.VFS.root( path )
      @pos          = 0
      @closed       = false
    end

    def close
      @closed = true
    end

    def each
      @virtual_file.children.each do |child|
        yield child.name
      end
    end

    def rewind
      @pos = 0
    end

    def read
      children = @virtual_file.children
      return nil unless ( @pos < children.size )
      child = children[@pos]
      @pos += 1
      child.name
    end
    
    def seek(i)
      @pos = i
      self
    end

    def pos=(i)
      @pos = i
    end

  end

end 


class GlobFilter
  include org.jboss.virtual.VirtualFileFilter

  def initialize(glob)
    glob_segments = glob.split( '/' )
    regexp_segments = []

    glob_segments.each do |gs|
      if ( gs == '**' )
        regexp_segments << '.*'
      else
        gs.gsub!( /\*/, '[^\/]*')
        gs.gsub!( /\?/, '.')
        regexp_segments << gs
      end
    end
    
    regexp_str = regexp_segments.join( '/' )
    regexp_str = "^#{regexp_str}$"
    @regexp = Regexp.new( regexp_str )
  end

  def accepts(file)
    !!( file.path_name =~ @regexp )
  end

end