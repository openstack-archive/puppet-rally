# == Class: rally::settings
#
# Configure Rally benchmarking settings
#
# === Parameters
#
# [*cirros_img_url*]
#   (Optional) CirrOS image URL
#   Defaults to $::os_service_default
#
# [*container_format*]
#   (Optional) Image container formate
#   Defaults to $::os_service_default
#
# [*disk_format*]
#   (Optional) Image disk format
#   Defaults to $::os_service_default
#
# [*openstack_client_http_timeout*]
#   (Optional) HTTP timeout for any of OpenStack service in seconds
#   Defaults to $::os_service_default
#
# [*project_domain*]
#   (Optional) ID of domain in which projects will be created.
#   Defaults to $::os_service_default
#
# [*resource_deletion_timeout*]
#   (Optional) A timeout in seconds for deleting resources
#   Defaults to $::os_service_default
#
# [*resource_management_workers*]
#   (Optional) How many concurrent threads use for serving users context
#   Defaults to $::os_service_default
#
# [*user_domain*]
#   (Optional) ID of domain in which users will be created.
#   Defaults to $::os_service_default
#
class rally::settings (
  $cirros_img_url                = $::os_service_default,
  $openstack_client_http_timeout = $::os_service_default,
  $project_domain                = $::os_service_default,
  $resource_deletion_timeout     = $::os_service_default,
  $resource_management_workers   = $::os_service_default,
  $user_domain                   = $::os_service_default,
) {

  include ::rally::settings::cinder
  include ::rally::settings::ec2
  include ::rally::settings::glance
  include ::rally::settings::heat
  include ::rally::settings::ironic
  include ::rally::settings::manila
  include ::rally::settings::murano
  include ::rally::settings::nova
  include ::rally::settings::sahara
  include ::rally::settings::swift

  rally_config {
    'DEFAULT/openstack_client_http_timeout':     value => $openstack_client_http_timeout;
    'cleanup/resource_deletion_timeout':         value => $resource_deletion_timeout;
    'image/cirros_img_url':                      value => $cirros_img_url;
    'users_context/project_domain':              value => $project_domain;
    'users_context/resource_management_workers': value => $resource_management_workers;
    'users_context/user_domain':                 value => $user_domain;
  }
}
