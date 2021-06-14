class Unit < ApplicationRecord
    belongs_to :hospitals, optional: true
    
    belongs_to :administrators, optional: true
    has_many :reviews
    validates :name, presence: true, uniqueness: true, length: { in: 3..200 }
    
    def avg_score
        reviews.average(:score)
    end
end
