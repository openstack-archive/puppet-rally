require 'spec_helper'

describe 'rally::settings::mistral' do

  let :params do
    {
    }
  end

  let :rally_mistral_params do
    {
      :mistral_execution_timeout => 10.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally mistral settings with default parameters' do
      is_expected.to contain_rally_config('benchmark/mistral_execution_timeout').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_mistral_params ) }
    it 'configures rally-settings-mistral settings with all parameters' do
      is_expected.to contain_rally_config('benchmark/mistral_execution_timeout').with(:value => 10.0)
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
