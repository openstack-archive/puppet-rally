require 'spec_helper'

describe 'rally::settings::heat' do

  let :params do
    {
    }
  end

  let :rally_heat_params do
    {
      :stack_create_prepoll_delay => 2.0,
      :stack_create_timeout => 3600.0,
      :stack_create_poll_interval => 1.0,
      :stack_delete_timeout => 3600.0,
      :stack_delete_poll_interval => 1.0,
      :stack_check_timeout => 3600.0,
      :stack_check_poll_interval => 1.0,
      :stack_update_prepoll_delay => 2.0,
      :stack_update_timeout => 3600.0,
      :stack_update_poll_interval => 1.0,
      :stack_suspend_timeout => 3600.0,
      :stack_suspend_poll_interval => 1.0,
      :stack_resume_timeout => 3600.0,
      :stack_resume_poll_interval => 1.0,
      :stack_snapshot_timeout => 3600.0,
      :stack_snapshot_poll_interval => 1.0,
      :stack_restore_timeout => 3600.0,
      :stack_restore_poll_interval => 1.0,
      :stack_scale_timeout => 3600.0,
      :stack_scale_poll_interval => 1.0,
      :stack_owner_role => 'heat_stack_owner',
      :stack_user_role => 'heat_stack_user',
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally heat settings with default parameters' do
      is_expected.to contain_rally_config('benchmark/heat_stack_create_prepoll_delay').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_create_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_create_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_delete_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_delete_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_check_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_check_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_update_prepoll_delay').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_update_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_update_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_suspend_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_suspend_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_resume_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_resume_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_snapshot_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_snapshot_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_restore_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_restore_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_scale_timeout').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('benchmark/heat_stack_scale_poll_interval').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('role/heat_stack_owner_role').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('role/heat_stack_user_role').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_heat_params ) }
    it 'configures rally-settings-heat settings with all parameters' do
      is_expected.to contain_rally_config('benchmark/heat_stack_create_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_create_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_create_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_delete_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_delete_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_check_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_check_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_update_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_update_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_update_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_suspend_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_suspend_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_resume_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_resume_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_snapshot_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_snapshot_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_restore_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_restore_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_scale_timeout').with(:value => 3600.0)
      is_expected.to contain_rally_config('benchmark/heat_stack_scale_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('role/heat_stack_owner_role').with(:value => 'heat_stack_owner')
      is_expected.to contain_rally_config('role/heat_stack_user_role').with(:value => 'heat_stack_user')
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
