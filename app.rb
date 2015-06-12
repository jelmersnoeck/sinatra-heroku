require './config/application'

class MyApp < Sinatra::Base
end

Dir[File.dirname(__FILE__) + '/app/controllers/*_controller.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each { |file| require file }
