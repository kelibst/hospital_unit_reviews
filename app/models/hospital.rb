class Hospital < ApplicationRecord
    has_many :units
    has_many :administrators
    validates :name, :start_date, :country, :region, :address, presence: true, uniqueness: true
end
