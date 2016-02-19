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

include_recipe "cygwin::default"

if node['cygwin']['ssh']['sshd_passwd'].nil? 
    raise "You MUST define a password for the sshd privileged user in your attributes! (node['cygwin']['ssh']['sshd_passwd'])"
end

packages = %w{openssh cygrunsrv}

packages.each do |pkg|
    cygwin_package pkg do
        action :install
    end
end

execute 'Stop sshd' do
    cwd 'C:\cygwin\bin' 
    environment ({'PATH' => '$PATH:.:/cygdrive/c/cygwin/bin'})
    command 'cygrunsrv -E sshd'
    only_if 'cygrunsrv -Q sshd'
end

execute 'Configure sshd service' do
    cwd 'C:\cygwin\bin'
    environment ({'PATH' => '$PATH:.:/cygdrive/c/cygwin/bin'})
    command "bash /usr/bin/ssh-host-config --yes --cygwin \"ntsec\" --user #{node['cygwin']['ssh']['sshd_user']} --pwd r\"#{node['cygwin']['ssh']['sshd_passwd']}\" "
    not_if('cygrunsrv -Q sshd').include? 'Running' 
end

execute 'Make sure the password does not expire' do
    command  "net user #{node['cygwin']['ssh']['sshd_user']} /expires:never /active:yes"
end

execute 'Start sshd' do
    cwd 'C:\cygwin\bin' 
    environment ({'PATH' => '$PATH:.:/cygdrive/c/cygwin/bin'})
    command 'cygrunsrv -S sshd'
    not_if ('cygrunsrv -Q sshd').include? 'Running'
end

windows_firewall_rule 'ssh' do
    localport '22'
    protocol 'TCP'
    firewall_action :allow
end
