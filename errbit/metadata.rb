name             'Errbit'
maintainer       'Daniel Paulus'
maintainer_email 'dpaulus@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures errbit'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends   'build-essential'
depends   'apache2'
depends   'passenger_apache2'
depends   'git'
depends   'mongodb'
