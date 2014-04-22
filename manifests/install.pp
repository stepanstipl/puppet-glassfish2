# == Class: glassfish::install
#
# This installs Glassfish packages
# See main Glassfish class for docs.
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#

class glassfish::install inherits glassfish {

  if $install_java == true {
    class{'java':
      before => Package['glassfish']
    }
  }

  package { 'glassfish':
    ensure => $my_package_ensure,
    name   => $package_name,
  } 

}
