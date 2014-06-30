name             'cayley'
maintainer       'Sean Stavropoulos'
maintainer_email 'sean.stavro@gmail.com'
license          'Apache 2.0'
description      'Installs and configures Cayley graph database'
version          '0.0.1'

recipe 'cayley::setup', 'Installs and configures a single Cayley instance'

%w(ubuntu amazon).each do |os|
  supports os
end