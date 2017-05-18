Puppet::Type.newtype(:rally_deployment, :self_refresh => true) do

  @doc = <<-EOS
    This type provides Puppet with the capabilities to
    create new deployments in rally. It requires to use an
    existing file previously defined.

    rally_deployment { 'deployment_name':
      filename => '/path/to/rally/deployment.json',
    }

    It will create a deployment called `deployment_name` with
    the configuration defined in `/path/to/rally/deployment.json`.
  EOS

  feature :refreshable, "The provider can recreate the deployment",
    :methods => [:recreate]

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name) do
    desc 'Name for the rally deployment'
  end

  newparam(:filename) do
    desc 'The deployment configuration. It has to be an existing machine'

    validate do |value|
      unless Puppet::Util.absolute_path?(value)
        raise Puppet::Error, "File paths must be fully qualified, not '#{value}'"
      end
    end
  end

  def refresh
    provider.recreate
  end
end
