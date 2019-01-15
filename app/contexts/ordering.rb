module Ordering
end

# Commands
require_dependency 'ordering/commands/submit_order'

# Command handlers
require_dependency 'ordering/command_handlers/on_submit_order'

# Events
require_dependency 'ordering/events/order_submitted'