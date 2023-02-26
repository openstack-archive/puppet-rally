#
# Class to execute rally dbsync
#
# == Parameters
#
# [*extra_params*]
#   (Optional) String of extra command line parameters to append
#   to the rally db sync command. These will be inserted in the command line
#   between 'rally' and 'db create'.
#   Defaults to '--config-file /etc/rally/rally.conf'
#
# [*db_sync_timeout*]
#   (Optional) Timeout for the execution of the db_sync
#   Defaults to 300
#
# [*upgrade*]
#   (Optional) Run rally db upgrade command instead of rally db create command.
#   Defaults to false
#
class rally::db::sync(
  $extra_params    = '--config-file /etc/rally/rally.conf',
  $db_sync_timeout = 300,
  $upgrade         = false,
) {

  include rally::deps

  validate_legacy(Boolean, 'validate_bool', $upgrade)

  $subcommand = $upgrade ? {
    true    => 'upgrade',
    default => 'create'
  }

  exec { 'rally db_sync':
    command     => "rally ${extra_params} db ${subcommand}",
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
