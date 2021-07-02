class Reviewer < ApplicationRecord
  belongs_to :hospital, optional: true
  has_many :slots
  has_many :units, :through => :slots
  before_save :downcase_email
  before_create :generate_active_code

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, length: { maximum: 15}, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :sex, presence: true, inclusion: { in: %w(male female),
    message: "%{value} is not a valid gender" }

  before_save :to_parametize


  def to_parametize
    self.username = "#{name.parameterize(preserve_case: true)}-#{SecureRandom.alphanumeric(5)}"
  end
  def downcase_email
    self.email = email.delete(' ').downcase
  end

  def generate_active_code
    self.activecode = SecureRandom.hex(4)
    self.activecode_sent_at = Time.now.utc
  end

  def activecode_valid?
    (activecode_sent_at + 7.days) < Time.now.utc
  end
end
