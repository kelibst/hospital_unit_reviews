class Hospital < ApplicationRecord
    has_many :units, dependent: :destroy
    has_many :administrators, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :start_date, :country, :region, :address, presence: true
    

    before_save :to_parametize


    def to_parametize
      self.username = "#{name.parameterize(preserve_case: true)}-#{SecureRandom.alphanumeric(5)}"
    end
end
