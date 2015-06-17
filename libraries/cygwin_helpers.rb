module Cygwin
	module Helpers
        require 'uri'
        include Chef::Mixin::ShellOut

        def proxy_command
        	proxy = Chef::Config['http_proxy']
        	return "" if proxy.nil?

        	# The configured proxy often is in the form of a uri, whereas setup.exe
        	# expects --proxy host:port
        	proxy_uri = URI(proxy)
        	proxy = "#{proxy_uri.host}:#{proxy_uri.port}" unless proxy_uri.host.nil?
        	return "--proxy #{proxy}"
        end

        def is_installed?(cygpath, package)
            cmd = shell_out!("cygcheck -c #{package}", {:cwd => "#{cygpath}/bin"})
            !!(cmd.stdout =~ /\WOK\r\n$/)
        end
    end
end