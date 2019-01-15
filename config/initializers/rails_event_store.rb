require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  Rails.configuration.event_store.tap do |store|
    store.subscribe(Orders::OnOrderSubmitted, to: [Ordering::OrderSubmitted])
  end

  Rails.configuration.command_bus.tap do |bus|
    bus.register(Ordering::SubmitOrder, Ordering::OnSubmitOrder.new(number_generator: Ordering::NumberGenerator.new))
  end
end
