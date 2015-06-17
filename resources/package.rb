actions :install, :uninstall
default_action :install

attr_accessor :exists

attribute :_setupcmd, :kind_of => String	# not user-visible
