class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.float :deposit_amount
      t.float :final_balance
      t.bigint :generated_coupon_id 
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true
      t.timestamps
    end
  end
end
