require 'spec_helper'

describe 'rally::settings::manila' do

  let :params do
    {
    }
  end

  let :rally_manila_params do
    {
      :share_create_prepoll_delay => 2.0,
      :share_create_timeout       => 300.0,
      :share_create_poll_interval => 3.0,
      :share_delete_timeout       => 180.0,
      :share_delete_poll_interval => 2.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally manila settings with default parameters' do
      is_expected.to contain_rally_config('openstack/manila_share_create_prepoll_delay').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_create_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_create_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_delete_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_delete_poll_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_manila_params ) }
    it 'configures rally-settings-manila settings with all parameters' do
      is_expected.to contain_rally_config('openstack/manila_share_create_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('openstack/manila_share_create_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('openstack/manila_share_create_poll_interval').with(:value => 3.0)
      is_expected.to contain_rally_config('openstack/manila_share_delete_timeout').with(:value => 180.0)
      is_expected.to contain_rally_config('openstack/manila_share_delete_poll_interval').with(:value => 2.0)
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
