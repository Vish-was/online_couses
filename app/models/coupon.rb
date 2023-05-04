class Coupon < ApplicationRecord
  # Association
  belongs_to :purchase
  # Callbacks
  before_create :generate_coupon
  # Scope
  scope :code_expiration, -> { where('DATE(expiration) >= ?', Date.today) }

  def generate_coupon
    self.code = loop do
      random_token = SecureRandom.base36.first(10)
      break random_token unless Coupon.exists?(code: random_token)
    end
  end

  def is_valid?
    (used_code == false)
  end
end
