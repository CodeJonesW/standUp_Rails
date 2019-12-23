class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :gender
      t.integer :company_id
      t.integer :team_id
      # t.string :password_digest
      t.timestamps
    end
  end
end
