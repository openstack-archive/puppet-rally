require 'spec_helper'

describe 'rally::settings::monasca' do

  let :params do
    {
    }
  end

  let :rally_monasca_params do
    {
      :monasca_metric_create_prepoll_delay => 10.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally monasca settings with default parameters' do
      is_expected.to contain_rally_config('openstack/monasca_metric_create_prepoll_delay').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_monasca_params ) }
    it 'configures rally-settings-monasca settings with all parameters' do
      is_expected.to contain_rally_config('openstack/monasca_metric_create_prepoll_delay').with(:value => 10.0)
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
