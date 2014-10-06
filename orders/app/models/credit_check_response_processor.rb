class CreditCheckResponseProcessor
  def initialize(uuid, approved, order_id)
    @uuid = uuid
    @approved = approved
    @order_id = order_id
  end

  def call
    process_response
  end

  private

  def process_response
    order = Order.find(@order_id)
    if @approved
      order.status = 'approved'
    else
      order.status = 'denied'
    end
    order.save!
  end
end
