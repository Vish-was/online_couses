class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.float :deposit_amount
      t.float :final_balance
      t.date :start_date
      t.float :default_coupon_amount 
      t.timestamps
    end
  end
end