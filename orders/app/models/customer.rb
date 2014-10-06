class Customer < ActiveRecord::Base
  before_create { self.uuid = SecureRandom.hex }
end
