module Cygwin
  module Helpers
    def proxy_command
      Chef::Config['http_proxy'].nil? ? '' : "--proxy #{Chef::Config['http_proxy']}"
    end

    def test_mirror_sites
      node['cygwin']['sites'].each do |mirror|
        uri = URI.parse(mirror)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        if response.code.to_i == 200
          return mirror
          exit 0
        end
      end
  end
 end
 end
