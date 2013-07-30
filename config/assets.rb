configure do
  require "sprockets"
  require "sprockets-helpers"
  set :assets, (Sprockets::Environment.new { |env|
    env.append_path(settings.root + "/assets/images")
    env.append_path(settings.root + "/assets/javascript")
    env.append_path(settings.root + "/assets/stylesheets")

    if ENV["RACK_ENV"] == "production"
      env.js_compressor  = YUI::JavaScriptCompressor.new
      env.css_compressor = YUI::CssCompressor.new
    end
  })
end
get "/assets/application*.js" do
  content_type("application/javascript")
  settings.assets["application.js"]
end
get "/assets/application*.css" do
  content_type("text/css")
  settings.assets["application.css"]
end
%w{jpg png gif jpeg svg}.each do |format|
  get "/assets/:image.#{format}" do |image|
    content_type("image/#{format}")
    settings.assets["#{image}.#{format}"]
  end
end