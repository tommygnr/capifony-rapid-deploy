# you should add 'deploy ALL=(root) NOPASSWD: /usr/sbin/service php5-fpm reload' to your  /etc/sudoers
namespace :server_web do
  desc "Reload PHP5-FPM (requires sudo access to /usr/sbin/service php5-fpm reload)"
  task :restart, :roles => [:nginx, :apache2] do
    parallel do |session|
      session.when "in?(:nginx)", "sudo /usr/sbin/service php5-fpm reload"
      session.when "in?(:apache2)", "sudo /usr/sbin/service apache2 restart"
    end
  end
end
