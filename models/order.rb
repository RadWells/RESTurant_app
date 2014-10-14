class Order < ActiveRecord::Base
  belongs_to(:foods)
  belongs_to(:party)
end
