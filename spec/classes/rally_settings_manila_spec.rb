require 'spec_helper'

describe 'rally::settings::manila' do

  let :params do
    {
    }
  end

  let :rally_manila_params do
    {
      :share_create_prepoll_delay  => 2.0,
      :share_create_timeout        => 300.0,
      :share_create_poll_interval  => 3.0,
      :share_delete_timeout        => 180.0,
      :share_delete_poll_interval  => 2.0,
      :access_create_timeout       => 300.1,
      :access_create_poll_interval => 3.1,
      :access_delete_timeout       => 180.1,
      :access_delete_poll_interval => 2.1,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally manila settings with default parameters' do
      is_expected.to contain_rally_config('openstack/manila_share_create_prepoll_delay').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_create_timeout').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_create_poll_interval').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_delete_timeout').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_share_delete_poll_interval').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_access_create_timeout').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_access_create_poll_interval').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_access_delete_timeout').with_value('<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/manila_access_delete_poll_interval').with_value('<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_manila_params ) }
    it 'configures rally-settings-manila settings with all parameters' do
      is_expected.to contain_rally_config('openstack/manila_share_create_prepoll_delay').with_value(2.0)
      is_expected.to contain_rally_config('openstack/manila_share_create_timeout').with_value(300.0)
      is_expected.to contain_rally_config('openstack/manila_share_create_poll_interval').with_value(3.0)
      is_expected.to contain_rally_config('openstack/manila_share_delete_timeout').with_value(180.0)
      is_expected.to contain_rally_config('openstack/manila_share_delete_poll_interval').with_value(2.0)
      is_expected.to contain_rally_config('openstack/manila_access_create_timeout').with_value(300.1)
      is_expected.to contain_rally_config('openstack/manila_access_create_poll_interval').with_value(3.1)
      is_expected.to contain_rally_config('openstack/manila_access_delete_timeout').with_value(180.1)
      is_expected.to contain_rally_config('openstack/manila_access_delete_poll_interval').with_value(2.1)
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
