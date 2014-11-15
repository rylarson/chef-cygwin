module Cygwin
	module Helpers
        def proxy_command
            Chef::Config['http_proxy'].nil? ? "" : "--proxy #{Chef::Config['http_proxy']}"
        end
    end
end