set :notifier_statsd_options do
    filename = File.expand_path(File.dirname(__FILE__) + "/../parameter/#{stage}/statsd.yml")
    statsd_parameters = YAML.load_file(filename)



    if statsd_parameters['statsd_client'].nil?
       abort 'statsd.yml should contain statsd_client:host and port'
    end

    statsd_parameters['statsd_client']
end
