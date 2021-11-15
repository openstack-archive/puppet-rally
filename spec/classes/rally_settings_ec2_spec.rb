require 'spec_helper'

describe 'rally::settings::ec2' do

  let :params do
    {
    }
  end

  let :rally_ec2_params do
    {
      :server_boot_prepoll_delay => 1.0,
      :server_boot_timeout       => 300.0,
      :server_boot_poll_interval => 1.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally ec2 settings with default parameters' do
      is_expected.to contain_rally_config('openstack/ec2_server_boot_prepoll_delay').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/ec2_server_boot_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/ec2_server_boot_poll_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_ec2_params ) }
    it 'configures rally-settings-ec2 settings with all parameters' do
      is_expected.to contain_rally_config('openstack/ec2_server_boot_prepoll_delay').with(:value => 1.0)
      is_expected.to contain_rally_config('openstack/ec2_server_boot_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('openstack/ec2_server_boot_poll_interval').with(:value => 1.0)
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
