# Parameters for puppet-rally
#
class rally::params {

  case $::osfamily {
    'RedHat': {
      $sqlite_package_name  = undef
    }
    'Debian': {
      $sqlite_package_name  = 'python-pysqlite2'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
