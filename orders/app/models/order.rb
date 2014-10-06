class Order < ActiveRecord::Base
  belongs_to :customer
   belongs_to :item
   validates_presence_of :item, :customer
end
