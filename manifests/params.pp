# Parameters for puppet-rally
#
class rally::params {

  case $::osfamily {
    'RedHat': {
      $sqlite_package_name  = undef
      $package_name  = 'openstack-rally'
    }
    'Debian': {
      $sqlite_package_name  = 'python-pysqlite2'
      $package_name  = 'rally'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
