class remove_lamp {
# execute 'apt-get update'
#exec { 'apt-update':                    # exec resource named 'apt-update'
 # command => '/usr/bin/apt-get update'  # command this resource will run
#}

# install apache2 package
package { 'apache2':
  #require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => purged,
}

# ensure apache2 service is running
#service { 'apache2':
 # ensure => running,
#}

# install mysql-server package
package { 'mysql-server':
  #require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => purged,
}

# ensure mysql service is running
service { 'mysql':
  ensure => stopped,
}

package { 'libapache2-mod-php':
 #require => Exec['apt-update'],
 ensure => purged,
}
# install php7 package
package { 'php':
  #require => Exec['apt-update'],        # require 'apt-update' before installing  
 ensure => absent,
 }

# ensure info.php file exists
#file { '/var/www/html/info.php':
#  ensure => file,
#  content => '<?php  phpinfo(); ?>',    # phpinfo code
#  require => Package['apache2'],        # require 'apache2' package before creating
#}
}
