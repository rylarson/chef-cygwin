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

directory node['cygwin']['download_path'] do
  recursive true
end

architecture = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "x86"

remote_file "#{node['cygwin']['download_path']}/setup.exe" do
  source "http://cygwin.com/setup-#{architecture}.exe"
  action :create
end

execute "setup.exe" do
  cwd node['cygwin']['download_path']
  command "setup.exe -q -O -R #{node['cygwin']['home']} -s #{node['cygwin']['site']} #{proxy_command}"
  not_if { File.exists?("C:/cygwin/etc/passwd") }
end

windows_path "#{node['cygwin']['home']}/bin".gsub( /\//, "\\") do
  action :add
end

# Initially install a list of defined packages
node['cygwin']['packages'].each do |pkg|
    cygwin_package pkg do
        action :install
    end
end
