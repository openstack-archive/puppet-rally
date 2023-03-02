# ==Class: rally::params
#
# Parameters for puppet-rally
#
class rally::params {
  include openstacklib::defaults

  case $facts['os']['family'] {
    'RedHat': {
      $package_name        = 'openstack-rally'
      $plugin_package_name = 'openstack-rally-plugins'
    }
    'Debian': {
      $package_name        = 'rally'
      $plugin_package_name = 'python3-rally-openstack'
    }
    default: {
      fail("Unsupported osfamily: ${facts['os']['family']}")
    }

  } # Case $facts['os']['family']
}
