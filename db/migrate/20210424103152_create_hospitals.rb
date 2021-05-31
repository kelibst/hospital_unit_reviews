class CreateHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.date :start_date
      t.string :country
      t.string :region
      t.string :address

      t.timestamps
    end
  end
end
