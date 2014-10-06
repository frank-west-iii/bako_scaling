class CreditCheckProcessor
  def initialize(uuid, value, order_id)
    @uuid = uuid
    @value = value
    @order_id = order_id
  end

  def call
    @customer = Customer.find_by(uuid: @uuid)
    process_credit
    send_message
  end

  private

  def process_credit
    @approval = @customer.approve_order(@value)
  end

  def send_message
    BunnyMessenger.new('credit_responses', {uuid: @uuid, approved: @approval, order_id: @order_id }.to_json).call
  end
end
