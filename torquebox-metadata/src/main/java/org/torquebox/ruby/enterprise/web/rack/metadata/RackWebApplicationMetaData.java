/*
 * JBoss, Home of Professional Open Source
 * Copyright 2009, Red Hat Middleware LLC, and individual contributors
 * by the @authors tag. See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package org.torquebox.ruby.enterprise.web.rack.metadata;

public class RackWebApplicationMetaData {
	
	private String host;
	private String context;
	
	private String rackApplicationPoolName;
	
	private String staticPathPrefix;

	public RackWebApplicationMetaData() {
		
	}
	
	public void setHost(String host) {
		this.host = host;
	}
	
	public String getHost() {
		return this.host;
	}
	
	public void setContext(String context) {
		this.context = context;
	}
	
	public String getContext() {
		return this.context;
	}
	
	public void setRackApplicationPoolName(String rackApplicationPoolName) {
		this.rackApplicationPoolName = rackApplicationPoolName;
	}
	
	public String getRackApplicationPoolName() {
		return this.rackApplicationPoolName;
	}
	
	public void setStaticPathPrefix(String staticPathPrefix) {
		this.staticPathPrefix = staticPathPrefix;
	}
	
	public String getStaticPathPrefix() {
		return this.staticPathPrefix;
	}

}
