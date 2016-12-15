require 'spec_helper'

describe 'rally::settings::watcher' do

  let :params do
    {
    }
  end

  let :rally_watcher_params do
    {
      :audit_launch_poll_interval => 2.0,
      :audit_launch_timeout       => 300,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally watcher settings with default parameters' do
      is_expected.to contain_rally_config('benchmark/watcher_audit_launch_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/watcher_audit_launch_timeout').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_watcher_params ) }
    it 'configures rally-settings-watcher settings with all parameters' do
      is_expected.to contain_rally_config('benchmark/watcher_audit_launch_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/watcher_audit_launch_timeout').with(:value => 300)
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
