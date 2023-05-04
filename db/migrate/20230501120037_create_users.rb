class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :encrypted_password
      t.string :reset_password_token
      t.string :reset_password_sent_at
      t.string :remember_created_at
      t.string :encrypted_password
      t.boolean :admin, default: false
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
      t.boolean :privacy_accepted, default: false
      t.boolean :newsletter, default: false
      t.timestamps
    end
  end
end
