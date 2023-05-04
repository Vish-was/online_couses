class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.float :discounted_amount
      t.float :referral_amount
      t.integer :limit, default: 10 
      t.date :expiration
      t.string :code
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
