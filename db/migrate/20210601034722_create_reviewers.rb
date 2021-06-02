class CreateReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.references :hospital, null: false, foreign_key: true
      t.string :activecode

      t.timestamps
    end
  end
end
