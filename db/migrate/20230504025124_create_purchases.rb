class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.float :deposit_amount
      t.float :final_balance
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :generated_coupon, foreign_key: {to_table: :coupons}
      t.timestamps
    end
  end
end
