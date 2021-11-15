require 'spec_helper'

describe 'rally::settings::magnum' do

  let :params do
    {
    }
  end

  let :rally_magnum_params do
    {
      :magnum_cluster_create_prepoll_delay => 9.0,
      :magnum_cluster_create_timeout       => 600.0,
      :magnum_cluster_create_poll_interval => 2.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally magnum settings with default parameters' do
      is_expected.to contain_rally_config('openstack/magnum_cluster_create_prepoll_delay').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/magnum_cluster_create_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/magnum_cluster_create_poll_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_magnum_params ) }
    it 'configures rally-settings-magnum settings with all parameters' do
      is_expected.to contain_rally_config('openstack/magnum_cluster_create_prepoll_delay').with(:value => 9.0)
      is_expected.to contain_rally_config('openstack/magnum_cluster_create_timeout').with(:value => 600.0)
      is_expected.to contain_rally_config('openstack/magnum_cluster_create_poll_interval').with(:value => 2.0)
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
