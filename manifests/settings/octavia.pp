# == Class: rally::settings::octavia
#
# Configure Rally benchmarking settings for Octavia
#
# === Parameters
#
# [*create_loadbalancer_timeout*]
#  (Optional) Octavia create loadbalancer timeout.
#  Defaults to $facts['os_service_default']
#
# [*delete_loadbalancer_timeout*]
#  (Optional) Octavia delete loadbalancer timeout.
#  Defaults to $facts['os_service_default']
#
# [*create_loadbalancer_poll_interval*]
#  (Optional) Octavia create loadbalancer pool interval.
#  Defaults to $facts['os_service_default']
#
class rally::settings::octavia (
  $create_loadbalancer_timeout       = $facts['os_service_default'],
  $delete_loadbalancer_timeout       = $facts['os_service_default'],
  $create_loadbalancer_poll_interval = $facts['os_service_default'],
) {

  include rally::deps

  rally_config {
    'openstack/octavia_create_loadbalancer_timeout':       value => $create_loadbalancer_timeout;
    'openstack/octavia_delete_loadbalancer_timeout':       value => $delete_loadbalancer_timeout;
    'openstack/octavia_create_loadbalancer_poll_interval': value => $create_loadbalancer_poll_interval;
  }
}
