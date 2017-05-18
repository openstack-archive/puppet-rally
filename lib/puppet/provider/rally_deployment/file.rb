Puppet::Type.type(:rally_deployment).provide(:file) do
  commands :rally => "/usr/bin/rally"

  def exists?
    result = rally "deployment", "list"
    result.include? resource[:name]
  end

  def create
    rally "deployment", "create", "--name", resource[:name], "--filename",
      resource[:filename]
  end

  def destroy
    rally "deployment", "destroy", resource[:name]
  end

  def recreate
    rally "deployment", "recreate", "--deployment", resource[:name], "--filename",
      resource[:filename]
  end

end
