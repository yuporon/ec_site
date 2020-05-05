class Order < ApplicationRecord
    belongs_to :end_user
    has_many :order_items
    enum payment_method: [:credit_card,:bank_transfer]
    enum status: [:waitng_pay,:confirmation_pay,:production,:preparations,:shipped]
end
