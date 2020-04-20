class Item < ApplicationRecord
    has_many :cart_items
    has_many :order_items
    belongs_to :genre, optional: true
    enum sale_status: { "-- 選択してください --": 0, 販売中: 1, 販売停止中: 2}
end
