# == Class: rally::settings::swift
#
# Configure Rally benchmarking settings
#
# === Parameters
#
# DEPRECATED PARAMETERS
#
# [*operator_role*]
#   (Optional) Role required for users to be able to create Swift containers
#   Defaults to undef
#
# [*reseller_admin_role*]
#   (Optional) User role that has reseller admin
#   Defaults to undef
#
class rally::settings::swift (
  # DEPRECATED PARAMETERS
  $operator_role       = undef,
  $reseller_admin_role = undef,
) {

  include rally::deps

  if $operator_role != undef{
    warning('The rally::settings::swift::operator_role parameter has been deprecated \
and has no effect')
  }
  if $reseller_admin_role != undef{
    warning('The rally::settings::swift::reseller_admin_role parameter has been deprecated \
and has no effect')
  }

  rally_config {
    'role/swift_operator_role':       ensure => absent;
    'role/swift_reseller_admin_role': ensure => absent;
  }
}
