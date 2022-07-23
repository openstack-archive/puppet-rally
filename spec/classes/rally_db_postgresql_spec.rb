require 'spec_helper'

describe 'rally::db::postgresql' do

  shared_examples_for 'rally::db::postgresql' do
    let :req_params do
      { :password => 'rallypass' }
    end

    let :pre_condition do
      'include postgresql::server'
    end

    context 'with only required parameters' do
      let :params do
        req_params
      end

      it { is_expected.to contain_class('rally::deps') }

      it { is_expected.to contain_openstacklib__db__postgresql('rally').with(
        :user       => 'rally',
        :password   => 'rallypass',
        :dbname     => 'rally',
        :encoding   => nil,
        :privileges => 'ALL',
      )}
    end

  end

  on_supported_os({
    :supported_os   => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge(OSDefaults.get_facts({
          # puppet-postgresql requires the service_provider fact provided by
          # puppetlabs-postgresql.
          :service_provider => 'systemd'
        }))
      end

      it_configures 'rally::db::postgresql'
    end
  end

end
