# General settings

default['splunk']['install_path']='/opt/splunkforwarder'

#Use json on Opsworks Stack setting to provided attribute information. Attributes can not be nil

default['splunk']['pass']='changeme'
default['splunk']['newpass']='default'
default['splunk']['forward_server']='default'
default['splunk']['receiver_port']='9997'
default['splunk']['auth']='admin'
default['splunk']['monitor_path']='default'
default['splunk']['group']='default'
