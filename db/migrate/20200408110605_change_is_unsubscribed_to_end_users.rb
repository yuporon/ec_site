class ChangeIsUnsubscribedToEndUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :end_users, :is_unsubscribed, :boolean, default: false, null: false
  end
end
