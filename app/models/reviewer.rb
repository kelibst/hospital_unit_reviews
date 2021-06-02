class Reviewer < ApplicationRecord
  belongs_to :hospital

  before_save :downcase_email

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, length: { maximum: 10}, uniqueness: true

  def downcase_email
    self.email = email.delete(' ').downcase
  end

  def generate_active_code
    self.activecode = SecureRandom.hex(4)
    self.activecode_sent_at = Time.now.utc
  end

  def activecode_valid?
    (activecode_sent_at + 7.days) > Time.now.utc
  end

  
end
