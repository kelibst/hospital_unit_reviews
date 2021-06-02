class AddPassWordResetFieldToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :administrators, :reset_password_token, :string
    add_column :administrators, :reset_password_sent_at, :datetime
  end
end
