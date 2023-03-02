# == Class: rally::settings::cinder
#
# Configure Rally benchmarking settings for Cinder
#
# === Parameters
#
# [*volume_create_poll_interval*]
#   (Optional) Interval between checks when waiting for volume creation.
#   Defaults to $facts['os_service_default']
#
# [*volume_create_prepoll_delay*]
#   (Optional) Time to sleep after creating a resource before polling for it
#   status
#   Defaults to $facts['os_service_default']
#
# [*volume_create_timeout*]
#   (Optional) Time to wait for cinder volume to be created.
#   Defaults to $facts['os_service_default']
#
# [*volume_delete_poll_interval*]
#   (Optional) Interval between checks when waiting for volume deletion.
#   Defaults to $facts['os_service_default']
#
# [*volume_delete_timeout*]
#   (Optional) Time to wait for cinder volume to be deleted.
#   Defaults to $facts['os_service_default']
#
# [*backup_restore_poll_interval*]
#   (Optional) Interval between checks when waiting for backup restoring.
#   Defaults to $facts['os_service_default']
#
# [*backup_restore_timeout*]
#   (Optional) Time to wait for cinder backup to be restored.
#   Defaults to $facts['os_service_default']
#
class rally::settings::cinder (
  $volume_create_poll_interval  = $facts['os_service_default'],
  $volume_create_prepoll_delay  = $facts['os_service_default'],
  $volume_create_timeout        = $facts['os_service_default'],
  $volume_delete_poll_interval  = $facts['os_service_default'],
  $volume_delete_timeout        = $facts['os_service_default'],
  $backup_restore_poll_interval = $facts['os_service_default'],
  $backup_restore_timeout       = $facts['os_service_default'],
) {

  include rally::deps

  rally_config {
    'openstack/cinder_volume_create_poll_interval':  value => $volume_create_poll_interval;
    'openstack/cinder_volume_create_prepoll_delay':  value => $volume_create_prepoll_delay;
    'openstack/cinder_volume_create_timeout':        value => $volume_create_timeout;
    'openstack/cinder_volume_delete_poll_interval':  value => $volume_delete_poll_interval;
    'openstack/cinder_volume_delete_timeout':        value => $volume_delete_timeout;
    'openstack/cinder_backup_restore_poll_interval': value => $backup_restore_poll_interval;
    'openstack/cinder_backup_restore_timeout':       value => $backup_restore_timeout;
  }
}
