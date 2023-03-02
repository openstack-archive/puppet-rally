# == Class: rally::settings::heat
#
# Configure Rally benchmarking settings for Heat
#
# === Parameters
#
# [*stack_check_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   checking.
#   Defaults to $facts['os_service_default']
#
# [*stack_check_timeout*]
#   (Optional) Time (in sec) to wait for stack to be checked.
#   Defaults to $facts['os_service_default']
#
# [*stack_create_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   creation.
#   Defaults to $facts['os_service_default']
#
# [*stack_create_prepoll_delay*]
#   (Optional) Time (in sec) to sleep after creating a resource before polling
#   for it status.
#   Defaults to $facts['os_service_default']
#
# [*stack_create_timeout*]
#   (Optional) Time (in sec) to wait for heat stack to be created.
#   Defaults to $facts['os_service_default']
#
# [*stack_delete_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   deletion.
#   Defaults to $facts['os_service_default']
#
# [*stack_delete_timeout*]
#   (Optional) Time (in sec) to wait for heat stack to be deleted.
#   Defaults to $facts['os_service_default']
#
# [*stack_restore_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack to
#   be restored.
#   Defaults to $facts['os_service_default']
#
# [*stack_restore_timeout*]
#   (Optional) Time (in sec) to wait for stack to be restored from snapshot.
#   Defaults to $facts['os_service_default']
#
# [*stack_resume_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   resume.
#   Defaults to $facts['os_service_default']
#
# [*stack_resume_timeout*]
#   (Optional) Time (in sec) to wait for stack to be resumed.
#   Defaults to $facts['os_service_default']
#
# [*stack_scale_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for a stack
#   to scale up or down.
#   Defaults to $facts['os_service_default']
#
# [*stack_scale_timeout*]
#   (Optional) Time (in sec) to wait for stack to scale up or down.
#   Defaults to $facts['os_service_default']
#
# [*stack_snapshot_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   snapshot to be created.
#   Defaults to $facts['os_service_default']
#
# [*stack_snapshot_timeout*]
#   (Optional) Time (in sec) to wait for stack snapshot to be created.
#   Defaults to $facts['os_service_default']
#
# [*stack_suspend_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   suspend.
#   Defaults to $facts['os_service_default']
#
# [*stack_suspend_timeout*]
#   (Optional) Time (in sec) to wait for stack to be suspended.
#   Defaults to $facts['os_service_default']
#
# [*stack_update_poll_interval*]
#   (Optional) Time interval (in sec) between checks when waiting for stack
#   update.
#   Defaults to $facts['os_service_default']
#
# [*stack_update_prepoll_delay*]
#   (Optional) Time (in sec) to sleep after updating a resource before polling
#   for it status.
#   Defaults to $facts['os_service_default']
#
# [*stack_update_timeout*]
#   (Optional) Time (in sec) to wait for stack to be updated.
#   Defaults to $facts['os_service_default']
#
class rally::settings::heat (
  $stack_check_poll_interval   = $facts['os_service_default'],
  $stack_check_timeout         = $facts['os_service_default'],
  $stack_create_poll_interval  = $facts['os_service_default'],
  $stack_create_prepoll_delay  = $facts['os_service_default'],
  $stack_create_timeout        = $facts['os_service_default'],
  $stack_delete_poll_interval  = $facts['os_service_default'],
  $stack_delete_timeout        = $facts['os_service_default'],
  $stack_restore_poll_interval = $facts['os_service_default'],
  $stack_restore_timeout       = $facts['os_service_default'],
  $stack_resume_poll_interval  = $facts['os_service_default'],
  $stack_resume_timeout        = $facts['os_service_default'],
  $stack_scale_poll_interval   = $facts['os_service_default'],
  $stack_scale_timeout         = $facts['os_service_default'],
  $stack_snapshot_poll_interval= $facts['os_service_default'],
  $stack_snapshot_timeout      = $facts['os_service_default'],
  $stack_suspend_poll_interval = $facts['os_service_default'],
  $stack_suspend_timeout       = $facts['os_service_default'],
  $stack_update_poll_interval  = $facts['os_service_default'],
  $stack_update_prepoll_delay  = $facts['os_service_default'],
  $stack_update_timeout        = $facts['os_service_default'],
) {

  include rally::deps

  rally_config {
    'openstack/heat_stack_check_poll_interval':    value => $stack_check_poll_interval;
    'openstack/heat_stack_check_timeout':          value => $stack_check_timeout;
    'openstack/heat_stack_create_poll_interval':   value => $stack_create_poll_interval;
    'openstack/heat_stack_create_prepoll_delay':   value => $stack_create_prepoll_delay;
    'openstack/heat_stack_create_timeout':         value => $stack_create_timeout;
    'openstack/heat_stack_delete_poll_interval':   value => $stack_delete_poll_interval;
    'openstack/heat_stack_delete_timeout':         value => $stack_delete_timeout;
    'openstack/heat_stack_restore_poll_interval':  value => $stack_restore_poll_interval;
    'openstack/heat_stack_restore_timeout':        value => $stack_restore_timeout;
    'openstack/heat_stack_resume_poll_interval':   value => $stack_resume_poll_interval;
    'openstack/heat_stack_resume_timeout':         value => $stack_resume_timeout;
    'openstack/heat_stack_scale_poll_interval':    value => $stack_scale_poll_interval;
    'openstack/heat_stack_scale_timeout':          value => $stack_scale_timeout;
    'openstack/heat_stack_snapshot_poll_interval': value => $stack_snapshot_poll_interval;
    'openstack/heat_stack_snapshot_timeout':       value => $stack_snapshot_timeout;
    'openstack/heat_stack_suspend_poll_interval':  value => $stack_suspend_poll_interval;
    'openstack/heat_stack_suspend_timeout':        value => $stack_suspend_timeout;
    'openstack/heat_stack_update_poll_interval':   value => $stack_update_poll_interval;
    'openstack/heat_stack_update_prepoll_delay':   value => $stack_update_prepoll_delay;
    'openstack/heat_stack_update_timeout':         value => $stack_update_timeout;
  }
}
