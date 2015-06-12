class MyApp < Sinatra::Base
  get '/' do
    ActiveRecord::Base.connection.current_database
  end
end
