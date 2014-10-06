require 'net/http'

class CreditCheckResponseProcessor
  def initialize(uuid, approved, order_id)
    @uuid = uuid
    @approved = approved
    @order_id = order_id
  end

  def call
    process_response
    send_faye_update
  end

  private

  def process_response
    @order = Order.find(@order_id)
    if @approved
      @order.status = 'approved'
    else
      @order.status = 'denied'
    end
    @order.save!
  end

  def send_faye_update
    message = {channel: "/messages/public", data: {order_id: @order.id, status: @order.status }}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
