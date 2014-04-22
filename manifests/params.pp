# == Class: glassfish::params
#
# Default parameters for Glassfish class
# See main Glassfish class for docs
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#

class glassfish::params {

  $service_manage  = true
  $service_enable  = true
  $service_running = true
  $service_ensure  = true

  $install_java    = false
  $java_xms        = '256m'
  $java_xmx        = '512m'
  $java_opts       = ''
  $java_home       = ''
  $java_keystore   = ''

  $package_name    = 'glassfish'
  $package_version = 'latest'
  $ensure          = 'present'

  #$home            = '/opt/glassfish'
  #$user            = 'daemon'
  #$group           = 'daemon'
  #$pidfile         = '/var/run/glassfish.pid'
  #$logdir          = '/var/log/glassfish'

}
