class Hospital < ApplicationRecord
    has_many :units
    has_many :administrators
    validates :name, presence: true, uniqueness: true
    validates :start_date, :country, :region, :address, presence: true
end
