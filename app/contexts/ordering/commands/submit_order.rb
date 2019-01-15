module Ordering
  class SubmitOrder < Command
    attribute :order_uid, Types::UUID
    attribute :source_language_id, Types::Coercible::Integer
    attribute :target_language_id, Types::Coercible::Integer
    attribute :source_text, Types::String
    attribute :comments, Types::String

    alias :aggregate_id :order_uid
  end
end