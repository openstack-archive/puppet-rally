#
# Class to execute rally dbsync
#
# == Parameters
#
# [*extra_params*]
#   (Optional) String of extra command line parameters to append
#   to the rally-manage db sync command. These will be inserted
#   in the command line between 'rally-manage' and 'db create'.
#   Defaults to '--config-file /etc/rally/rally.conf'
#
# [*db_sync_timeout*]
#   (Optional) Timeout for the execution of the db_sync
#   Defaults to 300
#
class rally::db::sync(
  $extra_params    = '--config-file /etc/rally/rally.conf',
  $db_sync_timeout = 300,
) {

  include rally::deps

  exec { 'rally-manage db_sync':
    command     => "rally-manage ${extra_params} db create",
    path        => '/usr/bin',
    user        => 'root',
    refreshonly => true,
    try_sleep   => 5,
    tries       => 10,
    timeout     => $db_sync_timeout,
    logoutput   => on_failure,
    subscribe   => [
      Anchor['rally::install::end'],
      Anchor['rally::config::end'],
      Anchor['rally::dbsync::begin']
    ],
    notify      => Anchor['rally::dbsync::end'],
    tag         => 'openstack-db',
  }

}
