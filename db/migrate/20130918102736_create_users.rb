class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      #t.string :password
      t.string :profile
      t.string :email
      t.string :remember_token, index: true
      t.references :cidade, index: true

      t.timestamps
    end
  end
end
