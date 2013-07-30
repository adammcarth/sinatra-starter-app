require "./app"
env = ENV['RACK_ENV']
DB_CONFIG = YAML::load(File.open('./config/database.yml'))
set :database, "#{DB_CONFIG[env]['adapter']}://#{DB_CONFIG[env]['username']}:#{DB_CONFIG[env]['password']}@#{DB_CONFIG[env]['host']}:#{DB_CONFIG[env]['port']}/#{DB_CONFIG[env]['database']}"
require "sprockets"
use Assets
run Sinatra::Application