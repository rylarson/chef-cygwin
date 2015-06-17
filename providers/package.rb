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

include Cygwin::Helpers

def whyrun_supported?
  true
end

def load_current_resource
  @current_resource = Chef::Resource::CygwinPackage.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  
  @current_resource.exists = is_installed?(node['cygwin']['home'], @new_resource.name)

  @current_resource._setupcmd(@new_resource._setupcmd || "setup.exe -q -O -R #{node['cygwin']['home']} -s #{node['cygwin']['site']} #{proxy_command}")
end

action :install do
  if @current_resource.exists
    Chef::Log.info "#{@current_resource} already installed"
  else
    pkg = current_resource.name
    cmd = current_resource._setupcmd
    ex  = execute "install Cygwin package: #{pkg}" do
      cwd node['cygwin']['download_path']
      command "#{cmd} -P #{pkg}"
    end

    @new_resource.updated_by_last_action(ex.updated_by_last_action?)
  end
end

action :uninstall do
  unless @current_resource.exists
    Chef::Log.info "#{@current_resource} already uninstalled"
  else
    pkg = current_resource.name
    cmd = current_resource._setupcmd
    ex  = execute "remove Cygwin package: #{pkg}" do
      cwd node['cygwin']['download_path']
      command "#{cmd} -x #{pkg}"
    end

    @new_resource.updated_by_last_action(ex.updated_by_last_action?)
  end
end
