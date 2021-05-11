class UpdateAdministrators < ActiveRecord::Migration[6.1]
  def change
    add_column :administrators, :email_confirmed, :boolean, null: false, default: false
    add_column :administrators,  :confirmation_token, :string
    add_column :administrators,  :confirmed_at, :datetime
    add_column :administrators,  :confirmation_sent_at, :datetime
  end
end
