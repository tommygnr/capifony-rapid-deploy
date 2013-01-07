namespace :composer do
  desc "Dump the autoload with composer"
  task :dump_autoload do
    base = release_path + "/"
    run "cd #{base} && composer dump-autoload --optimize"
  end
end
