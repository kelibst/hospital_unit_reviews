class AddHospitalToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_reference :administrators, :hospital, foreign_key: true
  end
end
