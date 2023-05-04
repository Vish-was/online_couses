class Purchase < ApplicationRecord
  # belongs_to :coupons, class_name: 'Coupon', foreign_key: 'generated_coupon_id', required: true
  after_create :create_coupon
  has_many :coupons
  belongs_to :user
  belongs_to :course

  #Create coupon for discount
  def create_coupon
    coupons.create(referral_amount: 50, discounted_amount: 10, expiration: Date.today+30.days)
  end

  def purchase_coupons
    coupons.code_expiration.map{|p| {code: p.code}}
  end

  def apply_coupon(coupon)
    coupon = Coupon.find_by(code: coupon)
  end
end
