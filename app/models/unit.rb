class Unit < ApplicationRecord
    belongs_to :hospitals, optional: true
    validates :name, presence: true, uniqueness: true
end
