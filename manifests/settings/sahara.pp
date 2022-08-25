# == Class: rally::settings::sahara
#
# Configure Rally benchmarking settings for Sahara
#
# === Parameters
#
# [*cluster_check_interval*]
#   (Optional) Cluster status polling interval in seconds
#   Defaults to $::os_service_default
#
# [*cluster_create_timeout*]
#   (Optional) A timeout in seconds for a cluster create operation
#   Defaults to $::os_service_default
#
# [*cluster_delete_timeout*]
#   (Optional) A timeout in seconds for a cluster delete operation
#   Defaults to $::os_service_default
#
# [*job_check_interval*]
#   (Optional) Job Execution status polling interval in seconds
#   Defaults to $::os_service_default
#
# [*job_execution_timeout*]
#   (Optional) A timeout in seconds for a Job Execution to complete
#   Defaults to $::os_service_default
#
# [*workers_per_proxy*]
#   (Optional) Amount of workers one proxy should serve to.
#   Defaults to $::os_service_default
#
class rally::settings::sahara (
  $cluster_check_interval = $::os_service_default,
  $cluster_create_timeout = $::os_service_default,
  $cluster_delete_timeout = $::os_service_default,
  $job_check_interval     = $::os_service_default,
  $job_execution_timeout  = $::os_service_default,
  $workers_per_proxy      = $::os_service_default,
) {

  include rally::deps

  rally_config {
    'openstack/sahara_cluster_check_interval': value => $cluster_check_interval;
    'openstack/sahara_cluster_create_timeout': value => $cluster_create_timeout;
    'openstack/sahara_cluster_delete_timeout': value => $cluster_delete_timeout;
    'openstack/sahara_job_check_interval':     value => $job_check_interval;
    'openstack/sahara_job_execution_timeout':  value => $job_execution_timeout;
    'openstack/sahara_workers_per_proxy':      value => $workers_per_proxy;
  }
}
