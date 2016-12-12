require 'spec_helper'

describe 'rally::settings::swift' do

  let :params do
    {
    }
  end

  let :rally_swift_params do
    {
      :operator_role       => 'Member',
      :reseller_admin_role => 'ResellerAdmin',
    }
  end

  shared_examples_for 'with default parameters' do
    it 'configures rally swift settings with default parameters' do
      is_expected.to contain_rally_config('role/swift_operator_role').with(:value => '<SERVICE DEFAULT>')
      is_expected.to contain_rally_config('role/swift_reseller_admin_role').with(:value => '<SERVICE DEFAULT>')
    end
  end

  shared_examples_for 'with all parameters' do
    before { params.merge!( rally_swift_params ) }
    it 'configures rally-settings-swift settings with all parameters' do
      is_expected.to contain_rally_config('role/swift_operator_role').with(:value => 'Member')
      is_expected.to contain_rally_config('role/swift_reseller_admin_role').with(:value => 'ResellerAdmin')
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
