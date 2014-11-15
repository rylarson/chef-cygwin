# cygwin cookbook

## Supported Platforms

Windows

## Recipes

### cygwin::default

#### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>`['cygwin']['download_path']`</tt></td>
    <td>`String`</td>
    <td>Path to download the cygwin installer executable</td>
    <td><tt>`Chef::Config['file_cache_path']`</tt></td>
  </tr>
  <tr>
    <td><tt>`['cygwin']['home']`</tt></td>
    <td>`String`</td>
    <td>Path to install cygwin</td>
    <td><tt>C:\cygwin</tt></td>
  </tr>
  <tr>
    <td><tt>`['cygwin']['site']`</tt></td>
    <td>`String`</td>
    <td>Mirror to use for downloading packages</td>
    <td><tt>http://mirrors.kernel.org/sourceware/cygwin/</tt></td>
  </tr>
</table>

### cygwin::ssh

#### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>`['cygwin']['ssh']['sshd_user']`</tt></td>
    <td>`String`</td>
    <td>User to run sshd as</td>
    <td><tt>cyg_server</tt></td>
  </tr>
  <tr>
    <td><tt>`['cygwin']['ssh']['sshd_password']`</tt></td>
    <td>`String`</td>
    <td>Password for the sshd user</td>
    <td><tt>`nil`</tt></td>
  </tr>
</table>

## License and Authors

Author:: Ryan Larson (ryan.mango.larson@gmail.com)
Author:: Ben Jansen (bjansen@w007.org)
