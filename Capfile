load 'deploy' if respond_to?(:namespace) # cap2 differentiator
require 'capifony_symfony2'
load 'app/deploy/deploy'
load 'app/deploy/recipes/fake_commands'


# ######################################################
# ######### Dependencies

# ######## A. Multistage
set :stages,        %w(production staging)
set :default_stage, "staging"
set :stage_dir,     "app/deploy"
require 'capistrano/ext/multistage'

# ######################################################

# ######## redis FlushDB
load 'app/deploy/recipes/redis_query_cache_clear'
after 'symfony:doctrine:migrations:migrate', 'redis:cache:clear'
after 'deploy:migrate', 'redis:cache:clear'

load 'app/deploy/recipes/set_nodes_from_remote_resource'

# ######## Vendors: copy vendors and then composer install
load 'app/deploy/recipes/copy_vendors'
before 'symfony:composer:install', 'composer:copy_vendors'

# ######## Assets_version file
load 'app/deploy/recipes/create_parameter_assets_version_file'
before 'symfony:bootstrap:build', 'parameter:create_assets_version_file'

# ######## Permission
load 'app/deploy/recipes/permissions_setfacl'
before 'deploy:share_childs', 'deploy:permissions_setfacl'

# ######## Dump Autoload before Cache
load 'app/deploy/recipes/dump_autoload'
before 'symfony:cache:clear', 'composer:dump_autoload'

# ######################################################
# ######## After

# ######## A.Migration
after 'deploy', 'symfony:doctrine:migrations:status'

# ######## B. keep the last releases remove the oldest
after "deploy", "deploy:cleanup"

# ######## C. Reload Web servers Nginx or Apache
load 'app/deploy/recipes/server_web_restart'
after 'symfony:cache:clear', 'server_web:restart'
after 'symfony:cache:warmup', 'server_web:restart'

