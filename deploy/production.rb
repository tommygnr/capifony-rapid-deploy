# ######## B. StatsD-Notifier
# if you want to disable this functionality remove here and under production and staging file
depend :local, :gem, "capistrano-notifier", ">=0.2.0"
require 'capistrano/notifier/statsd'
load 'app/deploy/recipes/set_notifier_statsd_option'

set :branch, "master"
set :repository,  "git@github.com:#{repository_vendor}/#{application}.git"




