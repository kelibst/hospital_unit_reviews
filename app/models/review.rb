class Review < ApplicationRecord
  belongs_to :unit
  belongs_to :reviewer
  validates :score, :title, :description, presence: true
  validates :score, :inclusion => 1..5
end
