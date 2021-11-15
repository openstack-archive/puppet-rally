require 'spec_helper'

describe 'rally::settings::sahara' do

  let :params do
    {
    }
  end

  let :rally_sahara_params do
    {
      :cluster_create_timeout => 1800,
      :cluster_delete_timeout => 900,
      :cluster_check_interval => 5,
      :job_execution_timeout  => 600,
      :job_check_interval     => 5,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally sahara settings with default parameters' do
      is_expected.to contain_rally_config('openstack/sahara_cluster_create_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/sahara_cluster_delete_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/sahara_cluster_check_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/sahara_job_execution_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/sahara_job_check_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_sahara_params ) }
    it 'configures rally-settings-sahara settings with all parameters' do
      is_expected.to contain_rally_config('openstack/sahara_cluster_create_timeout').with(:value => 1800)
      is_expected.to contain_rally_config('openstack/sahara_cluster_delete_timeout').with(:value => 900)
      is_expected.to contain_rally_config('openstack/sahara_cluster_check_interval').with(:value => 5)
      is_expected.to contain_rally_config('openstack/sahara_job_execution_timeout').with(:value => 600)
      is_expected.to contain_rally_config('openstack/sahara_job_check_interval').with(:value => 5)
    end
  end

  on_supported_os({
    :supported_os => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge!(OSDefaults.get_facts())
      end

      it_behaves_like 'with default parameters'
      it_behaves_like 'with all parameters'
    end
  end
end
