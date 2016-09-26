$script = <<-SCRIPT
 "set-item wsman:\\localhost\\shell\\maxmemorypershellmb 2048"
 SCRIPT

Vagrant.configure(2) do |config|
  config.vm.provision 'shell', inline: $script
end
