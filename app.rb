require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/activerecord'

class MyApp < Sinatra::Base
  def self.config_path
    MyApp.root + '/config'
  end

  register Sinatra::ConfigFile
  config_file "#{MyApp.config_path}/settings.yml"

  register Sinatra::ActiveRecordExtension
  set :database_file, "#{MyApp.config_path}/database.yml"

  configure :development, :test do
    require 'envyable'
    Envyable.load("#{MyApp.config_path}/env.yml", MyApp.environment.to_s)
  end
end

Dir[File.dirname(__FILE__) + '/app/controllers/*_controller.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each { |file| require file }
