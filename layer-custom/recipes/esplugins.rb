script "install_plugin_es_head" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
  	plugin -install mobz/elasticsearch-head
  	EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/head") }
end

script "install_plugin_es_hq" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
  	plugin -install royrusso/elasticsearch-HQ
	plugin -install elasticsearch/elasticsearch-lang-javascript/2.3.0
	plugin -install karmi/elasticsearch-paramedic
	plugin -install lukas-vlcek/bigdesk
  	EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/HQ") }
end

#notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
