class CreateSlot < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true

      t.timestamps
    end
    drop_table :unit_t0_reviews
  end
end
