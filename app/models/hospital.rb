class Hospital < ApplicationRecord
    has_many :units, dependent: :destroy
    has_many :administrators, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :start_date, :country, :region, :address, presence: true
end
