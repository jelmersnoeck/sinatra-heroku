require './config/application'

class MyApp < Sinatra::Base
end

Dir[File.dirname(__FILE__) + '/controllers/*_controller.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
