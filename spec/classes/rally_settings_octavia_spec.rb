require 'spec_helper'

describe 'rally::settings::octavia' do

  let :params do
    {
    }
  end

  let :rally_octavia_params do
    {
      :create_loadbalancer_timeout       => 500,
      :delete_loadbalancer_timeout       => 50,
      :create_loadbalancer_poll_interval => 2,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally octavia settings with default parameters' do
      is_expected.to contain_rally_config('openstack/octavia_create_loadbalancer_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/octavia_delete_loadbalancer_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('openstack/octavia_create_loadbalancer_poll_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_octavia_params ) }
    it 'configures rally-settings-octavia settings with all parameters' do
      is_expected.to contain_rally_config('openstack/octavia_create_loadbalancer_timeout').with(:value => 500)
      is_expected.to contain_rally_config('openstack/octavia_delete_loadbalancer_timeout').with(:value => 50)
      is_expected.to contain_rally_config('openstack/octavia_create_loadbalancer_poll_interval').with(:value => 2)
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
