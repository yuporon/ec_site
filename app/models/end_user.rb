class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :addresses
  
  acts_as_paranoid column: :is_unsubscribed,　column_type: 'boolean'

  def active_for_authentication?
    super && (self.is_unsubscribed == false)
  end
end
