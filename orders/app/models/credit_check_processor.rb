class CreditCheckProcessor
  def initialize(order_id)
    @order_id = order_id
  end

  def call
    @order = Order.find(@order_id)
    process_credit
  end

  private

  def process_credit
    BunnyMessenger.new('credit_queries', {uuid: @order.customer.uuid, value: @order.item.price, order_id: @order.id }.to_json).call
  end
end
