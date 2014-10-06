require 'bunny'

class BunnyMessenger
  def initialize(queue_name, message)
    @queue_name = queue_name
    @message = message
  end

  def call
    publish_message
  end

  private

  def publish_message
    connection.start
    exchange.publish(@message, routing_key: queue.name)
    connection.close
  end

  def connection
    @connection ||= Bunny.new
  end

  def exchange
    @exchange ||= channel.default_exchange
  end

  def channel
    @channel ||= connection.create_channel
  end

  def queue
    @queue ||= channel.queue(@queue_name, auto_delete: true)
  end

end
