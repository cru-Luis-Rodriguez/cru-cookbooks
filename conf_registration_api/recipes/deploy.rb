directory '/tmp/artifacts/crs-api' do
	
	
	action :create
end

git '/tmp/artifacts/crs-api' do
	depth 5
	repository 'git@github.com:CruGlobal/conf-registration-api.git'
	revision 'mvn-repo'
	user 'wildfly'
	group 'wildfly'
end

execute 'move file to server' do
	command 'mv *.war /opt/wildfly-' + node['wildfly']['version'] + '/standalone/deployments/crs-http-json-api.war'
	cwd '/tmp/artifacts/crs-api/conf-registration-api/org/cru/crs-http-json-api/' + node['crs-api']['version']
	group 'wildfly'
	user 'wildfly'
	
end