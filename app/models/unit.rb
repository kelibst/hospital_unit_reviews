class Unit < ApplicationRecord
    belongs_to :hospitals, optional: true
    
    belongs_to :administrators, optional: true
    has_many :reviews
    has_many :slots
    has_many :reviewers, :through => :slots
    validates :name, presence: true, uniqueness: true, length: { in: 3..200 }
    before_save :to_parametize

    def to_parametize
        self.unitname = "#{name.parameterize(preserve_case: true)}-#{SecureRandom.alphanumeric(5)}"
    end
    def avg_score
        reviews.average(:score)
    end
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
