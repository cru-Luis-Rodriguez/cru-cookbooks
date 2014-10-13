#
# Cookbook Name:: apt
# Resource:: repository
#
<<<<<<< HEAD
# Copyright 2010-2011, Opscode, Inc.
=======
# Copyright 2010-2013, Opscode, Inc.
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

actions :add, :remove
<<<<<<< HEAD

=======
default_action :add if defined?(default_action) # Chef > 10.8

# Needed for Chef versions < 0.10.10
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
def initialize(*args)
  super
  @action = :add
end

<<<<<<< HEAD
#name of the repo, used for source.list filename
=======
# name of the repo, used for source.list filename
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
attribute :repo_name, :kind_of => String, :name_attribute => true
attribute :uri, :kind_of => String
attribute :distribution, :kind_of => String
attribute :components, :kind_of => Array, :default => []
attribute :arch, :kind_of => String, :default => nil
<<<<<<< HEAD
#whether or not to add the repository as a source repo as well
=======
attribute :trusted, :kind_of => [TrueClass, FalseClass], :default => false
# whether or not to add the repository as a source repo as well
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
attribute :deb_src, :default => false
attribute :keyserver, :kind_of => String, :default => nil
attribute :key, :kind_of => String, :default => nil
attribute :cookbook, :kind_of => String, :default => nil
<<<<<<< HEAD
#trigger cache rebuild
#If not you can trigger in the recipe itself after checking the status of resource.updated{_by_last_action}?
=======
# trigger cache rebuild
# If not you can trigger in the recipe itself after checking the status of resource.updated{_by_last_action}?
>>>>>>> f7ce27c33876dd69c4b5fd03d890a1c8f911a5f4
attribute :cache_rebuild, :kind_of => [TrueClass, FalseClass], :default => true
