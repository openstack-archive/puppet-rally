# Parameters for puppet-rally
#
class rally::params {

  case $::osfamily {
    'RedHat': {
      $package_name  = 'openstack-rally'
    }
    'Debian': {
      $package_name  = 'rally'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
