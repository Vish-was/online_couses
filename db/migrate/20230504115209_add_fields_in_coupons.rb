class AddFieldsInCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :created_by, :integer
    add_column :coupons, :used_by, :integer
    add_column :coupons, :used_code, :boolean, default: false
  end
end
