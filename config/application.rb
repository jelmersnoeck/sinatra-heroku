require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/activerecord'

class MyApp < Sinatra::Base
  register Sinatra::ConfigFile
  config_file "./env.yml"

  configure :development, :test do
    ActiveRecord::Base.establish_connection(
      :adapter  => settings.DATABASE_SCHEME == 'postgres' ? 'postgresql' : settings.DATABASE_SCHEME,
      :host     => settings.DATABASE_HOST,
      :database => settings.DATABASE_NAME,
      :encoding => settings.DATABASE_ENCODING
    )
  end

  configure :production, :development do
    db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

    ActiveRecord::Base.establish_connection(
      :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
    )
  end
end
