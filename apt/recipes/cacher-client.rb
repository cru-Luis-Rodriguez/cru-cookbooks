#
# Cookbook Name:: apt
# Recipe:: cacher-client
#
<<<<<<< HEAD
# Copyright 2011, 2012 Opscode, Inc.
=======
# Copyright 2011-2013 Opscode, Inc.
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

<<<<<<< HEAD
#remove Acquire::http::Proxy lines from /etc/apt/apt.conf since we use 01proxy
#these are leftover from preseed installs
execute 'Remove proxy from /etc/apt/apt.conf' do
  command "sed --in-place '/^Acquire::http::Proxy/d' /etc/apt/apt.conf"
  only_if "grep Acquire::http::Proxy /etc/apt/apt.conf"
end

servers = []
if node['apt'] && node['apt']['cacher_ipaddress']
  cacher = Chef::Node.new
  cacher.name(node['apt']['cacher_ipaddress'])
  cacher.set['ipaddress'] = node['apt']['cacher_ipaddress']
  servers << cacher
end

unless Chef::Config[:solo]
  query = "apt_caching_server:true NOT name:#{node.name}"
=======
class ::Chef::Recipe
  include ::Apt
end

# remove Acquire::http::Proxy lines from /etc/apt/apt.conf since we use 01proxy
# these are leftover from preseed installs
execute 'Remove proxy from /etc/apt/apt.conf' do
  command "sed --in-place '/^Acquire::http::Proxy/d' /etc/apt/apt.conf"
  only_if 'grep Acquire::http::Proxy /etc/apt/apt.conf'
end

servers = []
if node['apt']
  if node['apt']['cacher_ipaddress']
    cacher = Chef::Node.new
    cacher.default.name = node['apt']['cacher_ipaddress']
    cacher.default.ipaddress = node['apt']['cacher_ipaddress']
    cacher.default.apt.cacher_port = node['apt']['cacher_port']
    cacher.default.apt_cacher_interface = node['apt']['cacher_interface']
    servers << cacher
  elsif node['apt']['caching_server']
    node.override['apt']['compiletime'] = false
    servers << node
  end
end

unless Chef::Config[:solo] || servers.length > 0
  query = 'apt_caching_server:true'
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
  query += " AND chef_environment:#{node.chef_environment}" if node['apt']['cacher-client']['restrict_environment']
  Chef::Log.debug("apt::cacher-client searching for '#{query}'")
  servers += search(:node, query)
end

if servers.length > 0
  Chef::Log.info("apt-cacher-ng server found on #{servers[0]}.")
<<<<<<< HEAD
  template '/etc/apt/apt.conf.d/01proxy' do
=======
  if servers[0]['apt']['cacher_interface']
    cacher_ipaddress = interface_ipaddress(servers[0], servers[0]['apt']['cacher_interface'])
  else
    cacher_ipaddress = servers[0].ipaddress
  end
  t = template '/etc/apt/apt.conf.d/01proxy' do
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
    source '01proxy.erb'
    owner 'root'
    group 'root'
    mode 00644
    variables(
<<<<<<< HEAD
      :proxy => servers[0]['ipaddress'],
      :port => node['apt']['cacher_port']
      )
  end.run_action(:create)
=======
      :proxy => cacher_ipaddress,
      :port => servers[0]['apt']['cacher_port'],
      :bypass => node['apt']['cache_bypass']
      )
    action(node['apt']['compiletime'] ? :nothing : :create)
    notifies :run, 'execute[apt-get update]', :immediately
  end
  t.run_action(:create) if node['apt']['compiletime']
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
else
  Chef::Log.info('No apt-cacher-ng server found.')
  file '/etc/apt/apt.conf.d/01proxy' do
    action :delete
  end
end
<<<<<<< HEAD
=======

include_recipe 'apt::default'
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
