class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  acts_as_paranoid column: :is_unsubscribed,　column_type: 'boolean'

  def active_for_authentication?
    super && (self.is_unsubscribed == false)
  end
end
