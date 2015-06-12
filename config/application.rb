require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/activerecord'

class MyApp < Sinatra::Base
  register Sinatra::ConfigFile
  config_file "#{File.dirname(__FILE__)}/settings.yml"

  register Sinatra::ActiveRecordExtension
  set :database_file, "#{File.dirname(__FILE__)}/database.yml"

  configure :development, :test do
    require 'envyable'
    Envyable.load("#{File.dirname(__FILE__)}/env.yml", MyApp.environment.to_s)
  end
end
