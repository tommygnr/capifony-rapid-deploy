set :application, "Repository-Name" #don't change this, is also the repo name
set :repository_vendor, "tvision"
set :domain,      "tvision.com"
set :deploy_to,   "/home/deploy/public_html/booking/"
set :app_path,    "app"
set :user,        "deploy"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :app_config_file, "parameters.ini"
## Repository

set :scm,         :git
set :branch, "stage"
set :model_manager, "doctrine"
set  :keep_releases,  3
set  :use_sudo,       false

# set :vendors_mode, "install"
set :use_composer, true
# set :update_vendors, false
# set :dump_assetic_assets, true
set :permission_method, :acl

# Set some paths to be shared between versions
set :shared_files,    ["app/config/parameters.ini", "app/config/parameters_parking.ini", "app/config/assets_version.ini", web_path + "/base", web_path + "/csv" ]
set :shared_children, [app_path + "/logs", web_path + "/uploads"]

# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL
