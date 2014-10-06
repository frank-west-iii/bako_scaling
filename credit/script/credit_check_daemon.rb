#!/usr/bin/env ruby

require 'rubygems'
require 'bunny'
require 'daemons'

ENV["RAILS_ENV"] ||= "development"
require "./config/environment"

options = { backtrace: true, dir: '.', log_output: false}

Daemons.run_proc('credit_check_daemon', options) do
  EventMachine.run do
    conn = Bunny.new
    conn.start

    ch = conn.create_channel
    q  = ch.queue("credit_queries", auto_delete: true)

    q.subscribe do |delivery_info, metadata, payload|
      obj = JSON.parse(payload)
      CreditCheckProcessor.new(obj['uuid'], obj['value'].to_d, obj['order_id']).delay.call
    end
  end
end
