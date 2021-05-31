class UpdateUnitHeadRole < ActiveRecord::Migration[6.1]
  def change
    change_column :administrators, :role, :string
  end
end
