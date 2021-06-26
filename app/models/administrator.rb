class Administrator < ApplicationRecord
  belongs_to :hospitals, optional: true
  has_many :units
    has_secure_password

    before_save :downcase_email
    before_create :generate_confirmation_instructions
  
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, length: { maximum: 14}
    validates :password,
              length: { minimum: 3 },
              if: -> { new_record? || !password.nil? }
  
    def downcase_email
      self.email = email.delete(' ').downcase
    end
  
    def generate_confirmation_instructions
      self.confirmation_token = SecureRandom.hex(10)
      self.confirmation_sent_at = Time.now.utc
    end
  
    def confirmation_token_valid?
      (confirmation_sent_at + 3.days) > Time.now.utc
    end
  
    def mark_as_confirmed!
      self.confirmation_token = nil
      self.confirmed_at = Time.now.utc
      self.email_confirmed = true
      save
    end
  
    def generate_password_token!
      self.reset_password_token = generate_token
      self.reset_password_sent_at = Time.now.utc
      save!
    end
  
    def password_token_valid?
      (reset_password_sent_at + 1.hours) > Time.now.utc
    end
  
    def reset_password!(password)
      self.reset_password_token = nil
      self.password = password
      save!
    end

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  
    private
  
    def generate_token
      SecureRandom.hex(10)
    end
end
