require 'spec_helper'

describe 'rally::settings::tempest' do

  let :params do
    {
    }
  end

  let :rally_tempest_params do
    {
      :img_url              => 'http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img',
      :img_disk_format      => 'raw',
      :img_container_format => 'ovf',
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally tempest settings with default parameters' do
      is_expected.to contain_rally_config('tempest/img_url').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/img_disk_format').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/img_name_regex').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/swift_operator_role').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/swift_reseller_admin_role').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/heat_stack_owner_role').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/heat_stack_user_role').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/flavor_ref_ram').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/flavor_ref_alt_ram').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('tempest/heat_instance_type_ram').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_tempest_params ) }
    it 'configures rally-settings-tempest settings with all parameters' do
      is_expected.to contain_rally_config('tempest/img_url').with(:value => 'http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img')
      is_expected.to contain_rally_config('tempest/img_disk_format').with(:value => 'raw')
      is_expected.to contain_rally_config('tempest/img_container_format').with(:value => 'ovf')
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
