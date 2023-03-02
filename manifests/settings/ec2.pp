# == Class: rally::settings::ec2
#
# Configure Rally benchmarking settings for EC2
#
# === Parameters
#
# [*server_boot_poll_interval*]
#   (Optional) Server boot poll interval
#   Defaults to $facts['os_service_default']
#
# [*server_boot_prepoll_delay*]
#   (Optional) Time to sleep after boot before polling for status
#   Defaults to $facts['os_service_default']
#
# [*server_boot_timeout*]
#   (Optional) Server boot timeout
#   Defaults to $facts['os_service_default']
#
class rally::settings::ec2 (
  $server_boot_poll_interval = $facts['os_service_default'],
  $server_boot_prepoll_delay = $facts['os_service_default'],
  $server_boot_timeout       = $facts['os_service_default'],
) {

  warning("The rally::settings::ec2 class has been deprecated and \
will be removed in a future release.")

  include rally::deps

  rally_config {
    'openstack/ec2_server_boot_poll_interval': value => $server_boot_poll_interval;
    'openstack/ec2_server_boot_prepoll_delay': value => $server_boot_prepoll_delay;
    'openstack/ec2_server_boot_timeout':       value => $server_boot_timeout;
  }
}
