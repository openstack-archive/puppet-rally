require 'spec_helper'

describe 'rally::db' do
  shared_examples 'rally::db' do
    context 'with default parameters' do
      it { is_expected.to contain_oslo__db('rally_config').with(
        :db_max_retries => '<SERVICE DEFAULT>',
        :connection     => 'sqlite:////var/lib/rally/rally.sqlite',
        :idle_timeout   => '<SERVICE DEFAULT>',
        :min_pool_size  => '<SERVICE DEFAULT>',
        :max_pool_size  => '<SERVICE DEFAULT>',
        :max_retries    => '<SERVICE DEFAULT>',
        :retry_interval => '<SERVICE DEFAULT>',
        :max_overflow   => '<SERVICE DEFAULT>',
        :pool_timeout   => '<SERVICE DEFAULT>',
      )}

      it { is_expected.to contain_file('/var/lib/rally').with(
        :ensure => 'directory',
        :owner  => 'root',
        :group  => 'root',
        :mode   => '0755',
        :path   => '/var/lib/rally',
      )}
    end

    context 'with specific parameters' do
      let :params do
        {
          :database_connection     => 'mysql://rally:rally@localhost/rally',
          :database_idle_timeout   => '3601',
          :database_min_pool_size  => '2',
          :database_max_retries    => '11',
          :database_retry_interval => '11',
          :database_max_pool_size  => '11',
          :database_max_overflow   => '21',
          :database_pool_timeout   => '21',
          :database_db_max_retries => '-1',
        }
      end

      it { is_expected.to contain_oslo__db('rally_config').with(
        :db_max_retries => '-1',
        :connection     => 'mysql://rally:rally@localhost/rally',
        :idle_timeout   => '3601',
        :min_pool_size  => '2',
        :max_pool_size  => '11',
        :max_retries    => '11',
        :retry_interval => '11',
        :max_overflow   => '21',
        :pool_timeout   => '21',
      )}

      it { is_expected.to_not contain_file('create_sqlite_directory') }
    end

    context 'with postgresql backend' do
      let :params do
        {
          :database_connection => 'postgresql://rally:rally@localhost/rally'
        }
      end

      it { is_expected.to contain_package('python-psycopg2').with_ensure('present') }
    end

    context 'with incorrect database_connection string' do
      let :params do
        {
          :database_connection => 'foodb://rally:rally@localhost/rally'
        }
      end

      it { should raise_error(Puppet::Error, /validate_re/) }
    end
  end

  on_supported_os({
    :supported_os => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge!(OSDefaults.get_facts())
      end

      it_behaves_like 'rally::db'
    end
  end
end
