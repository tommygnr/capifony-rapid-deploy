namespace :deploy do
  desc "set permission with facl"
  task :permissions_setfacl, :roles => :app, :except => { :no_release => true } do
    if writable_dirs && permission_method
      dirs = []

      writable_dirs.each do |link|
        if shared_children && shared_children.include?(link)
          absolute_link = shared_path + "/" + link
        else
          absolute_link = latest_release + "/" + link
        end

        dirs << absolute_link
      end

      methods = {
        :chmod => [
          "chmod +a \"#{user} allow delete,write,append,file_inherit,directory_inherit\" %s",
          "chmod +a \"#{webserver_user} allow delete,write,append,file_inherit,directory_inherit\" %s"
        ],
        :acl => [
          "sudo setfacl -R -m u:#{user}:rwx -m u:#{webserver_user}:rwx %s",
          "sudo setfacl -dR -m u:#{user}:rwx -m u:#{webserver_user}:rwx %s"
        ],
        :chown => ["chown #{webserver_user} %s"]
      }

      if methods[permission_method]
        capifony_pretty_print "--> Setting permissions"
        methods[permission_method].each do |cmd|
          run sprintf(cmd, dirs.join(' '))
        end
        capifony_puts_ok
      else
        capifony_puts " Permission method '#{permission_method}' does not exist.".yellow
      end
    end
  end
end