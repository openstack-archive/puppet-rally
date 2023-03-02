# == Class: rally::settings::watcher
#
# Configure Rally benchmarking settings for Watcher
#
# === Parameters
#
# [*audit_launch_poll_interval*]
#   (Optional) Watcher audit launch interval
#   Defaults to $facts['os_service_default']
#
# [*audit_launch_timeout*]
#   (Optional) Watcher audit launch timeout
#   Defaults to $facts['os_service_default']
#
class rally::settings::watcher (
  $audit_launch_poll_interval = $facts['os_service_default'],
  $audit_launch_timeout       = $facts['os_service_default'],
) {

  include rally::deps

  rally_config {
    'openstack/watcher_audit_launch_poll_interval': value => $audit_launch_poll_interval;
    'openstack/watcher_audit_launch_timeout':       value => $audit_launch_timeout;
  }
}
