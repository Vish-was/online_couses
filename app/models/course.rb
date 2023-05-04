class Course < ApplicationRecord
	has_many :purchases
	before_create :generate_coupon

	def generate_coupon
	  self.code = loop do
	    random_token = SecureRandom.base36
	    break random_token unless Coupon.exists?(code: random_token)
	  end
	end
end
