class Slot < ApplicationRecord
    belongs_to :unit
    belongs_to :reviewer
end
