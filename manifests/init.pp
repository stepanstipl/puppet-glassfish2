# == Class: glassfish
#
# Full description of class glassfish here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { glassfish:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class glassfish (
  $ensure          = $glassfish::params::ensure,
  #$home            = $glassfish::params::home,
  $install_java    = $glassfish::params::install_java,
  $java_xms        = $glassfish::params::java_xms,
  $java_xmx        = $glassfish::params::java_xmx,
  $java_opts       = $glassfish::params::java_opts,
  $java_home       = $glassfish::params::java_home,
  $java_ks         = $glassfish::params::java_ks,
  #$logdir          = $glassfish::params::logdir,
  $package_name    = $glassfish::params::package_name,
  $package_version = $glassfish::params::package_version,
  $package_ensure  = $glassfish::params::package_ensure,
  #$pidfile         = $glassfish::params::pidfile,
  $service_manage  = $glassfish::params::service_manage,
  $service_enable  = $glassfish::params::service_enable,
  $service_ensure  = $glassfish::params::service_ensure,
  #$user            = $glassfish::params::user,
  #$group            = $glassfish::params::group,
  
) inherits glassfish::params {
  
  validate_bool($service_manage)
  validate_bool($service_enable)
  validate_bool($install_java)

  $my_package_ensure = $ensure ? {
    'present' => $package_version,
    default => absent
  }

  $my_java_opts = "-Xmx${java_xmx} -Xms${java_xms} ${java_opts}"

  anchor {'glassfish::begin': }  ->
  class {'glassfish::install': } ->
  class {'glassfish::config': }  ->
  class {'glassfish::service': } ->
  anchor {'glassfish::end': }

}
