
require 'java'

module VFS
  def self.resolve_within_archive(path)
    return path if ( path =~ %r(^vfs[^:]+) )
    cur = path
    while ( cur != '.' && cur != '/' )
      if ( ::File.exist_without_vfs?( cur ) )
         
        return nil unless Java::OrgJbossVirtualPluginsContextJar::JarUtils.isArchive( ::File.basename( cur ) )
     
        child_path = path[cur.length..-1]

        if ( cur[-1,1] == '/' )
          cur = cur[0..-2]
        end
        cur = "#{cur}/#{child_path}"
        return VFS.resolve_path_url( cur )
      end
      cur = ::File.dirname( cur ) + '/'
    end
    nil
  end

  def self.resolve_path_url(path)
    prefix = "vfszip://"
    prefix += ::Dir.pwd unless ( path =~ /^\// )
    base = "#{prefix}/#{path}"
  end

end

require 'vfs/file'
require 'vfs/dir'
require 'vfs/glob_filter'
require 'vfs/ext/kernel'
require 'vfs/ext/vfs'
require 'vfs/ext/io'
require 'vfs/ext/file'
require 'vfs/ext/dir'


