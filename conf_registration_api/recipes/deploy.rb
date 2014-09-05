execute 'deploy-from-jenkins' do
  environment = {
      :name => 'targetEnvironment', :value => node['crs-api']['continuous-integration']['environment']
  }
  ip = {
      :name => 'targetServerIP', :value => node['opsworks']['instance']['private_ip']
  }
  password = {
      :name => 'deployerPassword', :value => node['wildfly']['deploy-password']
  }
  database_migration = {
      :name => 'databaseMigration', :value => node['crs-api']['continuous-integration']['database-migration']
  }

  json = Hash.new()
  json['parameter'] = Array.new()
  json['parameter'].push(environment)
  json['parameter'].push(ip)
  json['parameter'].push(password)
  json['parameter'].push(database_migration)

  command 'curl -X POST ' + node['crs-api']['continuous-integration']['build-url'] + ' -d token=' + node['crs-api']['continuous-integration']['api-token'] + ' --data-urlencode json="' + json.to_json + '"'
end