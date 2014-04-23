include_recipe "deploy"

node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]

  directory "#{deploy[:deploy_to]}" do
    action :create
    recursive true
    mode "0775"
    group deploy[:group]
    owner deploy[:user]
  end


  directory "#{deploy[:deploy_to]}/shared" do
    action :create
    recursive true
    mode "0775"
    group deploy[:group]
    owner deploy[:user]
  end

  directory "#{deploy[:deploy_to]}/shared/config" do
    action :create
    recursive true
    mode "0775"
    group deploy[:group]
    owner deploy[:user]
  end

  directory "#{deploy[:deploy_to]}/shared/config/initializers" do
    action :create
    recursive true
    mode "0775"
    group deploy[:group]
    owner deploy[:user]
  end

  template "#{deploy[:deploy_to]}/shared/config/secrets.yml" do
    source "secrets.yml.erb"
    cookbook 'autonag'
    mode "0660"
    group deploy[:group]
    owner deploy[:user]
    variables(:secrets => deploy[:secrets], :environment => deploy[:rails_env])
  end

  template "#{deploy[:deploy_to]}/shared/config/initializers/smtp.rb" do
    source "smtp.rb.erb"
    cookbook 'autonag'
    mode "0660"
    group deploy[:group]
    owner deploy[:user]
    variables(:smtp => deploy[:smtp] || {}, :environment => deploy[:rails_env])
  end

end
