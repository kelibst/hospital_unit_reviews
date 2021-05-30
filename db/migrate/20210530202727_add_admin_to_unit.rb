class AddAdminToUnit < ActiveRecord::Migration[6.1]
  def change
    add_reference :units, :administrators, foreign_key: true
  end
end
