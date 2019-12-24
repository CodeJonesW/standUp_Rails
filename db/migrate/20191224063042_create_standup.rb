class CreateStandup < ActiveRecord::Migration[5.2]
  def change
    create_table :standups do |t|
      t.integer :company_id
      t.integer :team_id
      t.integer :user_id
      t.string :yesterday
      t.string :today
      t.string :blocker
      t.timestamps
    end
  end
end
