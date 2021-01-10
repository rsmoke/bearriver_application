# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/rails'
require 'capistrano/bundler'
require "capistrano/rbenv"
require 'capistrano/puma'

#https://stackoverflow.com/questions/65359581/capostrano-cap-aborted-dont-know-how-to-build-task-start-see-the-list-of-a
install_plugin Capistrano::Puma::Daemon # Default puma tasks
install_plugin Capistrano::Puma::Workers
install_plugin Capistrano::Puma::Nginx # if you want to upload a nginx site template

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
