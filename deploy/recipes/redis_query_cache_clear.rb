namespace :redis do
 namespace :cache do
      desc "Clear all the redis cache"
      task :clear, :only => { :primary => true } do
         if !interactive_mode || Capistrano::CLI.ui.agree("Do you really want to flush redis db? (y/N)")

            filename = File.expand_path(File.dirname(__FILE__) + "/../parameter/#{stage}/redis.yml")
            parameters = YAML.load_file(filename)

            #only primary
            if parameters['redis_client'].nil?
               abort 'parameter/redis.yml should contain redis_client:host and port'
            else
               parameters['redis_client'].each do |option_item|
                   execute_redis_command(option_item)
               end
            end
        end
    end

    def compose_redis_command(db_to_flush)
        redis_commands = Array.new
        redis_commands.push "SELECT #{db_to_flush}"
        redis_commands.push "FLUSHDB"
        #return
        redis_commands.join("\r\n") << "\r\nA"
    end

    def execute_redis_command(option_item)
        capifony_pretty_print "--> Flushing db '#{option_item['flushdb']}' on redis #{option_item['host']} "
        run "(echo -en \"#{compose_redis_command(option_item['flushdb'])}\") | nc #{option_item['host']} #{option_item['port']} "
        capifony_puts_ok
    end

  end
end
