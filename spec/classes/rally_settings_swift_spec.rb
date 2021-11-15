require 'spec_helper'

describe 'rally::settings::swift' do

  let :params do
    {}
  end

  let :rally_swift_params do
    {}
  end

  shared_examples_for 'with default parameters' do
    # No test cases
  end

  shared_examples_for 'with all parameters' do
    # No test cases
    before { params.merge!( rally_swift_params ) }
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
