class Purchase < ApplicationRecord
  # belongs_to :coupons, class_name: 'Coupon', foreign_key: 'generated_coupon_id', required: true
  after_create :create_coupon
  has_many :coupons
  belongs_to :user
  belongs_to :course

  # Create coupon for discount
  def create_coupon
    coupons.create(referral_amount: 50, discounted_amount: 10, expiration: Date.today + 30.days, created_by: user_id)
  end

  def purchase_coupons
    coupons.code_expiration.map { |p| { code: p.code } }
  end

  def apply_coupon(coupon, _user)
    coupon = Coupon.code_expiration.find_by(code: coupon)
    if coupon&.is_valid?
      update_current_account(coupon)
      update_referral_account(coupon)
      true
    else
      false
    end
  end

  def update_referral_account(coupon)
    purchase = Purchase.find_by(user_id: coupon.created_by)
    discount = (purchase.final_balance - coupon.discounted_amount)
    update(final_balance: discount.to_i)
    coupon.update(used_code: true, used_by: user.id)
  end

  def update_current_account(coupon)
    discount = (final_balance - coupon.discounted_amount)
    update(final_balance: discount.to_i)
    coupon.update(used_code: true, used_by: user.id)
  end
end
