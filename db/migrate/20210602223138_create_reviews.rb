class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.integer :score
      t.references :unit, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
