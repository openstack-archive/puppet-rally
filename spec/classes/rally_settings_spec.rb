require 'spec_helper'

describe 'rally::settings' do

  let :params do
    {
    }
  end

  let :rally_settings_params do
    {
      :openstack_client_http_timeout => 180.0,
      :resource_deletion_timeout     => 600,
      :project_domain                => 'default',
      :resource_management_workers   => 30,
      :user_domain                   => 'default',
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally settings with default parameters' do
      is_expected.to contain_rally_config('cleanup/resource_deletion_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('users_context/project_domain').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('users_context/resource_management_workers').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('users_context/user_domain').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_settings_params ) }
    it 'configures rally settings with all parameters' do
      is_expected.to contain_rally_config('cleanup/resource_deletion_timeout').with(:value => 600)
      is_expected.to contain_rally_config('users_context/project_domain').with(:value => 'default')
      is_expected.to contain_rally_config('users_context/resource_management_workers').with(:value => 30)
      is_expected.to contain_rally_config('users_context/user_domain').with(:value => 'default')
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
