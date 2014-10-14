require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'resturant'
 })


require_relative 'models/food'
require_relative 'models/order'
require_relative 'models/party'


get '/' do
  "hello"
end