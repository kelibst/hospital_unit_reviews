class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :password_digest
      t.boolean :role
      t.string :email
      t.string :phone
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
