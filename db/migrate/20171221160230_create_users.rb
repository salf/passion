class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :email, null: false
      t.string :name
      t.string :oauth_token
      t.string :access_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
