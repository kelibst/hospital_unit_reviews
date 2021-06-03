class CreateUnitT0Review < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_t0_reviews do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
