require 'spec_helper'

describe 'rally::settings::ironic' do

  let :params do
    {
    }
  end

  let :rally_ironic_params do
    {
      :node_create_poll_interval => 1.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally ironic settings with default parameters' do
      is_expected.to contain_rally_config('benchmark/ironic_node_create_poll_interval').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_ironic_params ) }
    it 'configures rally-settings-ironic settings with all parameters' do
      is_expected.to contain_rally_config('benchmark/ironic_node_create_poll_interval').with(:value => 1.0)
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
