# == Class: rally::settings::manila
#
# Configure Rally benchmarking settings for Manila
#
# === Parameters
#
# [*share_create_poll_interval*]
#   (Optional) Interval between checks when waiting for Manila share creation.
#   Defaults to $facts['os_service_default']
#
# [*share_create_prepoll_delay*]
#   (Optional) Delay between creating Manila share and polling for its status.
#   Defaults to $facts['os_service_default']
#
# [*share_create_timeout*]
#   (Optional) Timeout for Manila share creation.
#   Defaults to $facts['os_service_default']
#
# [*share_delete_poll_interval*]
#   (Optional) Interval between checks when waiting for Manila share deletion.
#   Defaults to $facts['os_service_default']
#
# [*share_delete_timeout*]
#   (Optional) Timeout for Manila share deletion.
#   Defaults to $facts['os_service_default']
#
# [*access_create_poll_interval*]
#   (Optional) Interval between checks when waiting for Manila access creation.
#   Defaults to $facts['os_service_default']
#
# [*access_create_timeout*]
#   (Optional) Timeout for Manila access creation.
#   Defaults to $facts['os_service_default']
#
# [*access_delete_poll_interval*]
#   (Optional) Interval between checks when waiting for Manila access deletion.
#   Defaults to $facts['os_service_default']
#
# [*access_delete_timeout*]
#   (Optional) Timeout for Manila access deletion.
#   Defaults to $facts['os_service_default']
#
class rally::settings::manila (
  $share_create_poll_interval  = $facts['os_service_default'],
  $share_create_prepoll_delay  = $facts['os_service_default'],
  $share_create_timeout        = $facts['os_service_default'],
  $share_delete_poll_interval  = $facts['os_service_default'],
  $share_delete_timeout        = $facts['os_service_default'],
  $access_create_poll_interval = $facts['os_service_default'],
  $access_create_timeout       = $facts['os_service_default'],
  $access_delete_poll_interval = $facts['os_service_default'],
  $access_delete_timeout       = $facts['os_service_default'],
) {

  include rally::deps

  rally_config {
    'openstack/manila_share_create_poll_interval':  value => $share_create_poll_interval;
    'openstack/manila_share_create_prepoll_delay':  value => $share_create_prepoll_delay;
    'openstack/manila_share_create_timeout':        value => $share_create_timeout;
    'openstack/manila_share_delete_poll_interval':  value => $share_delete_poll_interval;
    'openstack/manila_share_delete_timeout':        value => $share_delete_timeout;
    'openstack/manila_access_create_poll_interval': value => $access_create_poll_interval;
    'openstack/manila_access_create_timeout':       value => $access_create_timeout;
    'openstack/manila_access_delete_poll_interval': value => $access_delete_poll_interval;
    'openstack/manila_access_delete_timeout':       value => $access_delete_timeout;
  }
}
