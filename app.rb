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
  erb :index
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
#+GET | /parties/:id | Display a single party and options for adding a food item to the party
#+GET | /parties/new | Display a form for a new party
#+POST | /parties | Creates a new party
#+GET | /parties/:id/edit | Display a form for to edit a party's details
#+PATCH | /parties/:id | Updates a party's details
#+DELETE | /parties/:id | Delete a party
#+POST | /orders | Creates a new order
#+PATCH | /orders/:id | Change item to no-charge
#+DELETE | /orders | Removes an order
#+GET | /parties/:id/receipt | Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
#+PATCH | /parties/:id/checkout | Marks the party as paid
