# Copyright 2012, La Presse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Chef::Resource::Execute.send(:include, Cygwin::Helpers)

action :install do
  execute "install Cygwin package: #{new_resource.name}" do
    cwd node['cygwin']['download_path']
    command "setup.exe -q -O -R #{node['cygwin']['home']} -s #{node['cygwin']['site']} #{proxy_command} -P #{new_resource.name}"
    not_if "#{node['cygwin']['home']}/bin/cygcheck -c #{new_resource.name}".include? "OK"
  end

  new_resource.updated_by_last_action(true)
end

action :uninstall do
  execute "remove Cygwin package: #{new_resource.name}" do
    cwd node['cygwin']['download_path']
    command "setup.exe -q -O -R #{node['cygwin']['home']} -s #{node['cygwin']['site']} #{proxy_command} -x #{new_resource.name}"
    only_if "#{node['cygwin']['home']}/bin/cygcheck -c #{new_resource.name}".include? "OK"
  end

  new_resource.updated_by_last_action(true)
end
