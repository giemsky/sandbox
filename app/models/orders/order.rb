module Orders
  class Order < ApplicationRecord
    self.table_name = 'orders'

    belongs_to :source_language, class_name: 'Orders::Language'
    belongs_to :target_language, class_name: 'Orders::Language'

    delegate :name, to: :source_language, prefix: true
    delegate :name, to: :target_language, prefix: true
  end
end