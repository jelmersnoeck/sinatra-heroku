class MyApp < Sinatra::Base
  get '/' do
    settings.DATABASE_NAME
  end
end
