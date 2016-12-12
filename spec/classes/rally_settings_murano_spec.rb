require 'spec_helper'

describe 'rally::settings::murano' do

  let :params do
    {
    }
  end

  let :rally_murano_params do
    {
      :deploy_environment_timeout        => 1200,
      :deploy_environment_check_interval => 5,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally murano settings with default parameters' do
      is_expected.to contain_rally_config('benchmark/murano_deploy_environment_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/murano_deploy_environment_check_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_murano_params ) }
    it 'configures rally-settings-murano settings with all parameters' do
      is_expected.to contain_rally_config('benchmark/murano_deploy_environment_timeout').with(:value => 1200)
      is_expected.to contain_rally_config('benchmark/murano_deploy_environment_check_interval').with(:value => 5)
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
