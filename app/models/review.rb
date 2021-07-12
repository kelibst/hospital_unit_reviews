class Review < ApplicationRecord
  belongs_to :unit
  belongs_to :reviewer
  validates :score, :title, :description, presence: true
  validates :score, :inclusion => 1..5


  before_create :to_parametize


  def to_parametize
    self.reviewname = loop do 
      paramTo = "#{title.parameterize(preserve_case: true)}-#{SecureRandom.alphanumeric(5)}"
      break paramTo unless Review.exists?(reviewname: paramTo)
    end
  end
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
