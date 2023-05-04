class Purchase < ApplicationRecord
  has_many :coupons
  belongs_to :user
  belongs_to :course
end
