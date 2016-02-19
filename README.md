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

#### Actions

  * `:install`
  * `:uninstall`

## Recipes

### cygwin::default

Installs cygwin

#### Attributes

Key | Type | Description | Default
--- | ---- | ----------- | -------
`['cygwin']['download_path']` | String | Path to download the cygwin installer executable | `Chef::Config['file_cache_path']`
`['cygwin']['home']` | String | Path to install cygwin | `C:\cygwin`
`['cygwin']['site']` | String | Mirror to use for downloading packages | `http://mirrors.kernel.org/sourceware/cygwin/`
`['cygwin']['packages']` | Array&lt;String&gt; | An optional list of cygwin packages to install | `[]`

### cygwin::ssh

Installs cygwin and configures openssh

#### Attributes

Key | Type | Description | Default
--- | ---- | ----------- | -------
`['cygwin']['ssh']['sshd_user']` | String | User to run sshd as | `cyg_server`
`['cygwin']['ssh']['sshd_passwd']` | String | Password for the sshd user | `nil`

## License and Authors

Author:: Ryan Larson (ryan.mango.larson@gmail.com)

Author:: Ben Jansen (aogail@w007.org)
