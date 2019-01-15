module Orders
  class OnOrderSubmitted
    def call(event)
      order = Order.new
      order.uid = event.data[:order_uid]
      order.number = event.data[:order_number]
      order.source_language_id = event.data[:source_language_id]
      order.target_language_id = event.data[:target_language_id]
      order.source_text = event.data[:source_text]
      order.comments = event.data[:comments]
      order.state = 'submitted'
      order.save!
    end
  end
end