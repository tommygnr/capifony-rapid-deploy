# This is a custom task and create the uploads/media folder when deploy:setup is called

namespace :parameter do
  desc "create the upload/media file"
  task :create_assets_version_file do
        # do not put the file into config because config is shared on nfs folder
        assets_parameter = release_path + "/app/logs/assets_version.ini"
        run "touch #{assets_parameter}"
        capifony_pretty_print "--> Creating  #{assets_parameter}"
        run "echo '[parameters]' > #{assets_parameter}"
        run "echo 'assets_version=\'#{release_name}\'' >> #{assets_parameter}"
        run "echo 'server_name=\'`hostname`\'' >> #{assets_parameter}"
        capifony_puts_ok
  end
end