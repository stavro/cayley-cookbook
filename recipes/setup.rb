#
# Cookbook Name:: cayley-cookbook
# Recipe:: default
#
# Copyright (C) 2014 Sean Stavropoulos
#
# All rights reserved - Do Not Redistribute
#

#
# 1. Create Directories
#

[:directory, :log_dir].each do |dir|
  directory node.cayley[dir] do
    recursive true
    owner 'root'
    action :create
  end
end

#
# 2. Download Cayley Archive
#

remote_file "#{node.cayley.directory}/#{node.cayley.archive_name}.tar.gz" do
  source node.cayley.archive_url
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

#
# 3. Extract Cayley
#

bash "install_cayley" do
  cwd node.cayley.directory
  not_if { ::File.directory?('cayley') }
  
  code <<-EOL
    tar --strip-components=1 -zxvf #{node.cayley.archive_name}.tar.gz 
  EOL
end

#
# 4. Write configuration file
#

template "#{node.cayley.directory}/cayley.cfg" do
  source 'cayley_cfg.erb'
  owner 'root'
  mode 0755
end

#
# 5. Create empty file for db_path if nonexistant
#

file node.cayley.db_path do
  owner 'root'
  group 'root'
  mode 0755
  action :create_if_missing
end

#
# 6. Register and Start Service
#

service "cayley" do
  supports :status => true, :start => true, :stop => true
end

template "/etc/init.d/cayley" do
  source "cayley_service_init.erb"
  owner 'root'
  mode 0755

  notifies :restart, "service[cayley]", :delayed
end