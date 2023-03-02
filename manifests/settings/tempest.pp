# == Class: rally::settings::tempest
#
# Configure Rally benchmarking settings
#
# === Parameters
#
# [*img_url*]
#   (Optional) image URL.
#   Defaults to $facts['os_service_default']
#
# [*img_disk_format*]
#   (Optional) Image disk format to use when creating the image.
#   Defaults to $facts['os_service_default']
#
# [*img_container_format*]
#   (Optional) Image container format to use when creating the image.
#   Defaults to $facts['os_service_default']
#
# [*img_name_regex*]
#   (Optional) Regular expression for name of a public image to discover it in the cloud and use it for the tests.
#   Defaults to $facts['os_service_default']
#
# [*swift_operator_role*]
#   (Optional) Role required for users to be able to create Swift containers.
#   Defaults to $facts['os_service_default']
#
# [*swift_reseller_admin_role*]
#   (Optional) User role that has reseller admin.
#   Defaults to $facts['os_service_default']
#
# [*heat_stack_owner_role*]
#   (Optional) Role required for users to be able to manage Heat stacks.
#   Defaults to $facts['os_service_default']
#
# [*heat_stack_user_role*]
#   (Optional) Role for Heat template-defined users.
#   Defaults to $facts['os_service_default']
#
# [*flavor_ref_ram*]
#   (Optional) Primary flavor RAM size used by most of the test cases.
#   Defaults to $facts['os_service_default']
#
# [*flavor_ref_alt_ram*]
#   (Optional) Alternate reference flavor RAM size used by test thatneed two
#   flavors, like those that resize an instnace.
#   Defaults to $facts['os_service_default']
#
# [*heat_instance_type_ram*]
#   (Optional) RAM size flavor used for orchestration test cases.
#   Defaults to $facts['os_service_default']
#
class rally::settings::tempest (
  $img_url                   = $facts['os_service_default'],
  $img_disk_format           = $facts['os_service_default'],
  $img_container_format      = $facts['os_service_default'],
  $img_name_regex            = $facts['os_service_default'],
  $swift_operator_role       = $facts['os_service_default'],
  $swift_reseller_admin_role = $facts['os_service_default'],
  $heat_stack_owner_role     = $facts['os_service_default'],
  $heat_stack_user_role      = $facts['os_service_default'],
  $flavor_ref_ram            = $facts['os_service_default'],
  $flavor_ref_alt_ram        = $facts['os_service_default'],
  $heat_instance_type_ram    = $facts['os_service_default']
) {

  include rally::deps

  rally_config {
    'openstack/img_url':                   value => $img_url;
    'openstack/img_disk_format':           value => $img_disk_format;
    'openstack/img_container_format':      value => $img_container_format;
    'openstack/img_name_regex':            value => $img_name_regex;
    'openstack/swift_operator_role':       value => $swift_operator_role;
    'openstack/swift_reseller_admin_role': value => $swift_reseller_admin_role;
    'openstack/heat_stack_owner_role':     value => $heat_stack_owner_role;
    'openstack/heat_stack_user_role':      value => $heat_stack_user_role;
    'openstack/flavor_ref_ram':            value => $flavor_ref_ram;
    'openstack/flavor_ref_alt_ram':        value => $flavor_ref_alt_ram;
    'openstack/heat_instance_type_ram':    value => $heat_instance_type_ram;
  }
}
