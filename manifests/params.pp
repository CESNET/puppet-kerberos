# Class: kerberos::params
#
# This class manages shared prameters and variables for the kerberos module
#
# [Remember: No empty lines between comments and class definition]
class kerberos::params (
# Common values
  $config_file               = '/etc/krb5.conf',
  $default_realm             = 'LOCAL',
  $krb4_config               = '/etc/krb.conf',
  $krb4_realms               = '/etc/krb.realms',
  $krb5_keytab_realm         = 'LOCAL',
  $krb5_keytab_service_realm = 'LOCAL',
  $krb5_keytab_rsh_principal = "host/${::fqdn}@${krb5_keytab_realm}",
  $krb5_keytab_rsh_host      = 'localhost',
  $krb5_keytab_services      = ['host'],
  $krb5_keytab_filename      = '/etc/krb5.keytab',
  $krb5_keytab_ensure        = present,
  $krb5_keytab_owner         = 'root',
  $krb5_keytab_group         = 'root',
  $krb5_keytab_mode          = '0600',
  $krb5_keytab_fqdn          = $::fqdn,
  $krb5_keytab_refresh       = false,
  $krb5_keytab_no_cache      = false,
  $krb5_keytab_kerberos      = 'mit',
) {

# OS specific values
  case $::osfamily {
    'Debian': {
      $package     = 'krb5-user'
    }
    'RedHat': {
        $package     = [
          'krb5-libs',
          'krb5-workstation'
        ]
    }
    default:{
      fail("The kerberos Puppet module does not support ${::osfamily} family of operating systems")
    }
  }
}
