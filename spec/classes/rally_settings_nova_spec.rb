require 'spec_helper'

describe 'rally::settings::nova' do

  let :params do
    {
    }
  end

  let :rally_nova_params do
    {
      :server_start_prepoll_delay          => 0.0,
      :server_start_timeout                => 300.0,
      :server_start_poll_interval          => 1.0,
      :server_stop_prepoll_delay           => 0.0,
      :server_stop_timeout                 => 300.0,
      :server_stop_poll_interval           => 2.0,
      :server_boot_prepoll_delay           => 1.0,
      :server_boot_timeout                 => 300.0,
      :server_boot_poll_interval           => 1.0,
      :server_delete_prepoll_delay         => 2.0,
      :server_delete_timeout               => 300.0,
      :server_delete_poll_interval         => 2.0,
      :server_reboot_prepoll_delay         => 2.0,
      :server_reboot_timeout               => 300.0,
      :server_reboot_poll_interval         => 2.0,
      :server_rebuild_prepoll_delay        => 1.0,
      :server_rebuild_timeout              => 300.0,
      :server_rebuild_poll_interval        => 1.0,
      :server_rescue_prepoll_delay         => 2.0,
      :server_rescue_timeout               => 300.0,
      :server_rescue_poll_interval         => 2.0,
      :server_unrescue_prepoll_delay       => 2.0,
      :server_unrescue_timeout             => 300.0,
      :server_unrescue_poll_interval       => 2.0,
      :server_suspend_prepoll_delay        => 2.0,
      :server_suspend_timeout              => 300.0,
      :server_suspend_poll_interval        => 2.0,
      :server_resume_prepoll_delay         => 2.0,
      :server_resume_timeout               => 300.0,
      :server_resume_poll_interval         => 2.0,
      :server_pause_prepoll_delay          => 2.0,
      :server_pause_timeout                => 300.0,
      :server_pause_poll_interval          => 2.0,
      :server_unpause_prepoll_delay        => 2.0,
      :server_unpause_timeout              => 300.0,
      :server_unpause_poll_interval        => 2.0,
      :server_shelve_prepoll_delay         => 2.0,
      :server_shelve_timeout               => 300.0,
      :server_shelve_poll_interval         => 2.0,
      :server_unshelve_prepoll_delay       => 2.0,
      :server_unshelve_timeout             => 300.0,
      :server_unshelve_poll_interval       => 2.0,
      :server_image_create_prepoll_delay   => 0.0,
      :server_image_create_timeout         => 300.0,
      :server_image_create_poll_interval   => 2.0,
      :server_image_delete_prepoll_delay   => 0.0,
      :server_image_delete_timeout         => 300.0,
      :server_image_delete_poll_interval   => 2.0,
      :server_resize_prepoll_delay         => 2.0,
      :server_resize_timeout               => 400.0,
      :server_resize_poll_interval         => 5.0,
      :server_resize_confirm_prepoll_delay => 0.0,
      :server_resize_confirm_timeout       => 200.0,
      :server_resize_confirm_poll_interval => 2.0,
      :server_resize_revert_prepoll_delay  => 0.0,
      :server_resize_revert_timeout        => 200.0,
      :server_resize_revert_poll_interval  => 2.0,
      :server_live_migrate_prepoll_delay   => 1.0,
      :server_live_migrate_timeout         => 400.0,
      :server_live_migrate_poll_interval   => 2.0,
      :server_migrate_prepoll_delay        => 1.0,
      :server_migrate_timeout              => 400.0,
      :server_migrate_poll_interval        => 2.0,
      :detach_volume_timeout               => 200.0,
      :detach_volume_poll_interval         => 2.0,
      :vm_ping_poll_interval               => 1.0,
      :vm_ping_timeout                     => 120.0,
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally nova settings with default parameters' do
      [ :server_start_prepoll_delay, :server_start_timeout,
        :server_start_poll_interval, :server_stop_prepoll_delay,
        :server_stop_timeout, :server_stop_poll_interval,
        :server_boot_prepoll_delay, :server_boot_timeout,
        :server_boot_poll_interval, :server_delete_prepoll_delay,
        :server_delete_timeout, :server_delete_poll_interval,
        :server_reboot_prepoll_delay, :server_reboot_timeout,
        :server_reboot_poll_interval, :server_rebuild_prepoll_delay,
        :server_rebuild_timeout, :server_rebuild_poll_interval,
        :server_rescue_prepoll_delay, :server_rescue_timeout,
        :server_rescue_poll_interval, :server_unrescue_prepoll_delay,
        :server_unrescue_timeout, :server_unrescue_poll_interval,
        :server_suspend_prepoll_delay, :server_suspend_timeout,
        :server_suspend_poll_interval, :server_resume_prepoll_delay,
        :server_resume_timeout, :server_resume_poll_interval,
        :server_pause_prepoll_delay, :server_pause_timeout,
        :server_pause_poll_interval, :server_unpause_prepoll_delay,
        :server_unpause_timeout, :server_unpause_poll_interval,
        :server_shelve_prepoll_delay, :server_shelve_timeout,
        :server_shelve_poll_interval, :server_unshelve_prepoll_delay,
        :server_unshelve_timeout, :server_unshelve_poll_interval,
        :server_image_create_prepoll_delay, :server_image_create_timeout,
        :server_image_create_poll_interval, :server_image_delete_prepoll_delay,
        :server_image_delete_timeout, :server_image_delete_poll_interval,
        :server_resize_prepoll_delay, :server_resize_timeout,
        :server_resize_poll_interval, :server_resize_confirm_prepoll_delay,
        :server_resize_confirm_timeout, :server_resize_confirm_poll_interval,
        :server_resize_revert_prepoll_delay, :server_resize_revert_timeout,
        :server_resize_revert_poll_interval, :server_live_migrate_prepoll_delay,
        :server_live_migrate_timeout, :server_live_migrate_poll_interval,
        :server_migrate_prepoll_delay, :server_migrate_timeout,
        :server_migrate_poll_interval, :detach_volume_timeout,
        :detach_volume_poll_interval, ].each { |param|
           is_expected.to contain_rally_config("benchmark/nova_#{param}").with_value('<SERVICE DEFAULT>')
         }

        is_expected.to contain_rally_config('benchmark/vm_ping_poll_interval').with(:value => '<SERVICE DEFAULT>')
        is_expected.to contain_rally_config('benchmark/vm_ping_timeout').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_nova_params ) }
    it 'configures rally-settings-nova settings with all parameters' do
      is_expected.to contain_rally_config('benchmark/nova_server_start_prepoll_delay').with(:value => 0.0)
      is_expected.to contain_rally_config('benchmark/nova_server_start_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_start_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_stop_prepoll_delay').with(:value => 0.0)
      is_expected.to contain_rally_config('benchmark/nova_server_stop_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_stop_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_boot_prepoll_delay').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_boot_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_boot_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_delete_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_delete_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_delete_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_reboot_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_reboot_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_reboot_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_rebuild_prepoll_delay').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_rebuild_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_rebuild_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_rescue_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_rescue_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_rescue_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unrescue_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unrescue_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unrescue_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_suspend_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_suspend_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_suspend_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resume_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resume_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resume_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_pause_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_pause_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_pause_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unpause_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unpause_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unpause_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_shelve_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_shelve_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_shelve_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unshelve_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unshelve_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_unshelve_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_image_create_prepoll_delay').with(:value => 0.0)
      is_expected.to contain_rally_config('benchmark/nova_server_image_create_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_image_create_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_image_delete_prepoll_delay').with(:value => 0.0)
      is_expected.to contain_rally_config('benchmark/nova_server_image_delete_timeout').with(:value => 300.0)
      is_expected.to contain_rally_config('benchmark/nova_server_image_delete_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_prepoll_delay').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_timeout').with(:value => 400.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_poll_interval').with(:value => 5.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_confirm_prepoll_delay').with(:value => 0.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_confirm_timeout').with(:value => 200.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_confirm_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_revert_prepoll_delay').with(:value => 0.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_revert_timeout').with(:value => 200.0)
      is_expected.to contain_rally_config('benchmark/nova_server_resize_revert_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_live_migrate_prepoll_delay').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_live_migrate_timeout').with(:value => 400.0)
      is_expected.to contain_rally_config('benchmark/nova_server_live_migrate_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_server_migrate_prepoll_delay').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/nova_server_migrate_timeout').with(:value => 400.0)
      is_expected.to contain_rally_config('benchmark/nova_server_migrate_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/nova_detach_volume_timeout').with(:value => 200.0)
      is_expected.to contain_rally_config('benchmark/nova_detach_volume_poll_interval').with(:value => 2.0)
      is_expected.to contain_rally_config('benchmark/vm_ping_poll_interval').with(:value => 1.0)
      is_expected.to contain_rally_config('benchmark/vm_ping_timeout').with(:value => 120.0)
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
