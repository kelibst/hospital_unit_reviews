class AddHospitalToUnit < ActiveRecord::Migration[6.1]
  def change
    add_reference :units, :hospitals, foreign_key: true
  end
end
