############# CONFIG #############
require "bundler"
Bundler.require :default
require "cgi"
require "yaml"
require "json"

CONFIG = YAML.load_file("config/config.yml")
CONFIG["install_settings"].each do |k, v|
  set k.to_sym, v
end
class Assets < Sinatra::Base
  require "./config/assets"
end


########## HELPER METHODS ##########
helpers do
  require "./config/helpers/string"
  require "./helpers/datetime"

  include Sprockets::Helpers
  Sprockets::Helpers.configure do |config|
    config.environment = assets
    config.prefix = '/assets'
    config.digest = true
    config.debug = true if ENV["RACK_ENV"] == "development"
  end

  def page_title
    defined?(@page_title) ?
      @page_title.to_s + " |" : nil
  end
  def uploads_path
    "./uploads"
  end
  def render(*args)
    if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
      return erb "_#{args.first[:partial]}".to_sym, :layout => false
    else
      super
    end
  end
  def parsed_url
    u = URI.parse(request.url)
    return CGI.parse(u.query) if u.query
  end
  def query_string(target)
    t = target
    return parsed_url[t].first if parsed_url
  end
end


############  ACTIONS  #############
Dir["./models/*.rb"].each &method(:require)

get "/" do
  @page_title = "First Page"
  erb :index
end