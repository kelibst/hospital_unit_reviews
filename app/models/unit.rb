class Unit < ApplicationRecord
    belongs_to :hospitals, optional: true
    belongs_to :administrators, optional: true
    validates :name, presence: true, uniqueness: true
end
