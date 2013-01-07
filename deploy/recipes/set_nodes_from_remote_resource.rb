namespace :deploy do
  task :set_nodes_from_remote_resource do
    # Here you will fetch the list of servers from somewhere

    filename = File.expand_path(File.dirname(__FILE__) + "/../parameter/#{stage}/server.yml")
    parameters = YAML.load_file(filename)

    roles[:app].clear
    roles[:db].clear

    nodes = parameters['servers']
    nodes.each do |node|
        # remove the hostname from the array
        hostname = node.shift
        # adding giving roles
        add_roles_to(hostname, node)

    end

    # Add primary=>true to the first
    primary = roles[:app].first
    primary.options[:primary] = true
    roles[:db].push(primary)
  end

  def add_roles_to(server, roles_to_add)
    # adding the roles to the hostname
    roles_to_add.each do |role|
        roles[role.to_sym].push(server)
    end
  end

end

on :start, 'deploy:set_nodes_from_remote_resource'