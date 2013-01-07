namespace :symfony do
 namespace :cache do
      desc "Warmup all caches for booking and parking this replace the normal one"
      task :warmup do
        base = release_path + "/"
        capifony_pretty_print "--> Warming up cache for 'prod' "
        run "cd #{base} && app/console cache:warmup --env=prod"
        capifony_puts_ok

        capifony_pretty_print "--> Warming up cache for 'parking_prod' "
        run "cd #{base} && app/console cache:warmup --env=parking_prod"
        capifony_puts_ok
    end
  end
end


