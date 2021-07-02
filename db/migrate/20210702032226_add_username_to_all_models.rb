class AddUsernameToAllModels < ActiveRecord::Migration[6.1]
  def change
     add_column :hospitals, :username, :string, null: false
     add_column :reviewers, :sex, :string, null: false
     add_column :administrators, :username, :string, null: false
     add_column :reviewers, :username, :string, null: false
     add_column :reviews, :reviewname, :string, null: false
     add_column :units, :unitname, :string, null: false
  end
end
