#
# Class to execute rally dbsync
#
# == Parameters
#
# [*extra_params*]
#   (optional) String of extra command line parameters to append
#   to the rally-manage db sync command. These will be inserted
#   in the command line between 'rally-manage' and 'db create'.
#   Defaults to '--config-file /etc/rally/rally.conf'
#
class rally::db::sync(
  $extra_params = '--config-file /etc/rally/rally.conf',
) {

  include ::rally::params

  Package<| tag == 'rally-package' |> ~> Exec['rally-manage db_sync']

  Rally_config<||> ~> Exec['rally-manage db_sync']

  exec { 'rally-manage db_sync':
    command     => "rally-manage ${extra_params} db create",
    path        => '/usr/bin',
    user        => 'root',
    refreshonly => true,
    logoutput   => on_failure,
  }

}
