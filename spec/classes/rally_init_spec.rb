require 'spec_helper'

describe 'rally' do

  shared_examples 'rally' do

    context 'with default parameters' do
     it 'contains the logging class' do
       is_expected.to contain_class('rally::logging')
     end

      it 'installs packages' do
        is_expected.to contain_package('rally').with(
          :name   => platform_params[:package_name],
          :ensure => 'present',
          :tag    => ['openstack', 'rally-package']
        )
      end

      it 'configures default rally params' do
        is_expected.to contain_rally_config('DEFAULT/rally_debug').with_value('<SERVICE DEFAULT>')
        is_expected.to contain_rally_config('DEFAULT/openstack_client_http_timeout').with_value('<SERVICE DEFAULT>')
      end
    end

    context 'with overridden parameters' do
      let :params do
        { :rally_debug                    => true,
          :openstack_client_http_timeout  => '200' }
      end

      it 'configures default rally params' do
        is_expected.to contain_rally_config('DEFAULT/rally_debug').with_value(true)
        is_expected.to contain_rally_config('DEFAULT/openstack_client_http_timeout').with_value('200')
      end
    end
  end

  on_supported_os({
    :supported_os   => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge!(OSDefaults.get_facts())
      end

      let(:platform_params) do
        case facts[:osfamily]
        when 'Debian'
          { :package_name => 'rally' }
        when 'RedHat'
          { :package_name => 'openstack-rally' }
        end
      end
      it_behaves_like 'rally'
    end
  end


end
