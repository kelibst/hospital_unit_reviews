class AddTokenGenToReviewer < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewers, :active, :boolean, null: false, default: false
    add_column :reviewers, :activecode_sent_at, :datetime
  end
end
