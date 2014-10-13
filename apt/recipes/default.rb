#
# Cookbook Name:: apt
# Recipe:: default
#
<<<<<<< HEAD
# Copyright 2008-2011, Opscode, Inc.
# Copyright 2009, Bryan McLellan <btm@loftninjas.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
=======
# Copyright 2008-2013, Opscode, Inc.
# Copyright 2009, Bryan McLellan <btm@loftninjas.org>
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

<<<<<<< HEAD
# Run apt-get update to create the stamp file
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  not_if do ::File.exists?('/var/lib/apt/periodic/update-success-stamp') end
end

# For other recipes to call to force an update
execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
=======
# On systems where apt is not installed, the resources in this recipe are not
# executed. However, they _must_ still be present in the resource collection
# or other cookbooks which notify these resources will fail on non-apt-enabled
# systems.

Chef::Log.debug 'apt is not installed. Apt-specific resources will not be executed.' unless apt_installed?

# If compile_time_update run apt-get update at compile time
e = execute 'apt-get-update' do
  command 'apt-get update'
  ignore_failure true
  only_if { apt_installed? }
  action :nothing
end
e.run_action(:run) if node['apt']['compile_time_update']

# Run apt-get update to create the stamp file
execute 'apt-get-update' do
  command 'apt-get update'
  ignore_failure true
  only_if { apt_installed? }
  not_if { ::File.exists?('/var/lib/apt/periodic/update-success-stamp') }
end

# For other recipes to call to force an update
execute 'apt-get update' do
  command 'apt-get update'
  ignore_failure true
  only_if { apt_installed? }
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
  action :nothing
end

# Automatically remove packages that are no longer needed for dependencies
<<<<<<< HEAD
execute "apt-get autoremove" do
  command "apt-get -y autoremove"
=======
execute 'apt-get autoremove' do
  command 'apt-get -y autoremove'
  only_if { apt_installed? }
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
  action :nothing
end

# Automatically remove .deb files for packages no longer on your system
<<<<<<< HEAD
execute "apt-get autoclean" do
  command "apt-get -y autoclean"
=======
execute 'apt-get autoclean' do
  command 'apt-get -y autoclean'
  only_if { apt_installed? }
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
  action :nothing
end

# provides /var/lib/apt/periodic/update-success-stamp on apt-get update
<<<<<<< HEAD
package "update-notifier-common" do
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

execute "apt-get-update-periodic" do
  command "apt-get update"
  ignore_failure true
  only_if do
    ::File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
    ::File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
=======
package 'update-notifier-common' do
  notifies :run, 'execute[apt-get-update]', :immediately
  only_if { apt_installed? }
end

execute 'apt-get-update-periodic' do
  command 'apt-get update'
  ignore_failure true
  only_if do
    apt_installed? &&
    ::File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
    ::File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - node['apt']['periodic_update_min_delay']
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
  end
end

%w{/var/cache/local /var/cache/local/preseeding}.each do |dirname|
  directory dirname do
<<<<<<< HEAD
    owner "root"
    group "root"
    mode  00755
    action :create
=======
    owner 'root'
    group 'root'
    mode  00755
    action :create
    only_if { apt_installed? }
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
  end
end
