require 'aggregate_root'

module Ordering
  class Order
    include AggregateRoot

    AlreadySubmitted = Class.new(StandardError)

    def initialize(uid)
      @uid = uid
      @state = :new
    end

    def submit(order_number, source_language_id, target_language_id, source_text, comments)
      raise AlreadySubmitted unless @state = :new

      apply OrderSubmitted.new(data: {
          order_uid: @uid,
          order_number: order_number,
          source_language_id: source_language_id,
          target_language_id: target_language_id,
          source_text: source_text,
          comments: comments
      })
    end

    on OrderSubmitted do |event|
      @order_number = event.data[:order_number]
      @source_language_id = event.data[:source_language_id]
      @target_language_id = event.data[:target_language_id]
      @source_text = event.data[:source_text]
      @comments = event.data[:comments]
    end
  end
end