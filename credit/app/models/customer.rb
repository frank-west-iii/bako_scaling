class Customer < ActiveRecord::Base

  def approve_order value
    if (current_balance + value) <= credit_limit
      self.current_balance += value
      self.save
      return true
    end
    return false
  end
end
