require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'skeets'
 })


require_relative 'models/food'
require_relative 'models/order'
require_relative 'models/party'


get '/' do
  erb :index
end


get '/foods' do
  @menu = Food.all
  erb :'foods/index'
end

get '/foods/new' do
  erb :'foods/new'
end

get '/foods/:id' do
  @item = Food.find(params[:id])
  erb :"foods/show"
end


post '/foods' do
  name = params['food_name']
  cuisine = params['food_cuisine']
  price = params['food_price']
  Food.create({name: name, cuisine: cuisine, price: price})
  redirect '/foods'
end


get '/foods/:id/edit'  do
  @food = Food.find(params[:id])
  erb :"foods/edit"
end

patch '/foods/:id' do
  @food = Food.find(params[:id])
  name = params['food_name']
  cuisine = params['food_cuisine']
  price = params['food_price']
  @food.update({name: name, cuisine: cuisine, price: price})
  redirect '/foods'
end

delete '/foods/:id' do
  Food.delete(params[:id])
  redirect '/foods'
end


#GET | / | Displays links to navigate the application (including links to each current parties)

#+GET | /foods | Display a list of food items available
#+GET | /foods/:id | Display a single food item and a list of all the parties that included it
#+GET | /foods/new | Display a form for a new food item
#+POST | /foods | Creates a new food item
#+GET | /foods/:id/edit | Display a form to edit a food item
#+PATCH | /foods/:id | Updates a food item
#+DELETE | /foods/:id | Deletes a food item


#+GET | /parties | Display a list of all parties
get '/parties' do
  @patrons = Party.all
  erb :'party/index'
end

#+GET | /parties/:id | Display a single party and options for adding a food item to the party

#+GET | /parties/new | Display a form for a new party

get '/parties/new' do
  erb :'party/new'
end

#+POST | /parties | Creates a new party
post '/parties' do
  table = params['table_number']
  size = params['size']
  paid = params['paid']
  Party.create({table_number: table, size: size, paid: paid})
  redirect '/parties'
end


get '/parties/:id' do
  @party = Party.find(params[:id])
  erb :"party/show"
end


#+GET | /parties/:id/edit | Display a form for to edit a party's details
get '/parties/:id/edit'  do
  @party = Party.find(params[:id])
  erb :"party/edit"
end

#+PATCH | /parties/:id | Updates a party's details
patch '/parties/:id' do
  @group = Party.find(params[:id])
  table = params['table_number']
  size = params['size']
  paid = params['paid']
  @group.update({table_number: table, size: size, paid: paid})
  redirect '/parties'
end

#+DELETE | /parties/:id | Delete a party
delete '/parties/:id' do
  Party.delete(params[:id])
  redirect '/parties'
end

#+POST | /orders | Creates a new order
post '/parties' do
  table = params['table_number']
  size = params['size']
  paid = params['paid']
  Party.create({table_number: table, size: size, paid: paid})
  redirect '/parties'
end



#+PATCH | /orders/:id | Change item to no-charge




#+DELETE | /orders | Removes an order



#+GET | /parties/:id/receipt | Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
#+PATCH | /parties/:id/checkout | Marks the party as paid
