class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :password_digest
      t.string :role
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
