class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum is_production: [:not_proceed,:waiting_production,:production,:production_comp]
end
