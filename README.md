# cygwin cookbook

## Supported Platforms

Windows

## Providers

### cygwin_package

Install or remove cygwin packages.

Example usage:

```ruby
cygwin_package 'openssh' do
    action :install
end
```

<table>
  <tr>
    <th>Actions</th>
  </tr>
  <tr>
    <td>:install</td>
  </tr>
  <tr>
    <td>:uninstall</td>
  </tr>
</table>


## Recipes

### cygwin::default

Installs cygwin

#### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cygwin']['download_path']</tt></td>
    <td>String</td>
    <td>Path to download the cygwin installer executable</td>
    <td><tt>Chef::Config['file_cache_path']</tt></td>
  </tr>
  <tr>
    <td><tt>['cygwin']['home']</tt></td>
    <td>String</td>
    <td>Path to install cygwin</td>
    <td><tt>C:\cygwin</tt></td>
  </tr>
  <tr>
    <td><tt>['cygwin']['site']</tt></td>
    <td>String</td>
    <td>Mirror to use for downloading packages</td>
    <td><tt>http://mirrors.kernel.org/sourceware/cygwin/</tt></td>
  </tr>
  <tr>
    <td><tt>['cygwin']['packages']</tt></td>
    <td>Array&lt;String&gt;</td>
    <td>An optional list of cygwin packages to install</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

### cygwin::ssh

Installs cygwin and configures openssh

#### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cygwin']['ssh']['sshd_user']</tt></td>
    <td>String</td>
    <td>User to run sshd as</td>
    <td><tt>cyg_server</tt></td>
  </tr>
  <tr>
    <td><tt>['cygwin']['ssh']['sshd_passwd']</tt></td>
    <td>String</td>
    <td>Password for the sshd user</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## License and Authors

Author:: Ryan Larson (ryan.mango.larson@gmail.com)

Author:: Ben Jansen (bjansen@w007.org)
