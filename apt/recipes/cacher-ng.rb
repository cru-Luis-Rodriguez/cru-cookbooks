#
# Cookbook Name:: apt
# Recipe:: cacher-ng
#
<<<<<<< HEAD
# Copyright 2008-2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
=======
# Copyright 2008-2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
<<<<<<< HEAD
# distributed under the License is distributed on an "AS IS" BASIS,
=======
# distributed under the License is distributed on an 'AS IS' BASIS,
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.set['apt']['caching_server'] = true

<<<<<<< HEAD
package "apt-cacher-ng" do
  action :install
end

template "/etc/apt-cacher-ng/acng.conf" do
  source "acng.conf.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :restart, "service[apt-cacher-ng]"
end

service "apt-cacher-ng" do
  supports :restart => true, :status => false
  action [:enable, :start]
end

#this will help seed the proxy
include_recipe "apt::cacher-client"
=======
package 'apt-cacher-ng' do
  action :install
end

directory node['apt']['cacher_dir'] do
  owner 'apt-cacher-ng'
  group 'apt-cacher-ng'
  mode 0755
end

template '/etc/apt-cacher-ng/acng.conf' do
  source 'acng.conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, 'service[apt-cacher-ng]', :immediately
end

service 'apt-cacher-ng' do
  supports :restart => true, :status => false
  action [:enable, :start]
end
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
