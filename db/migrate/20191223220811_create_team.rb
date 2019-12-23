class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :about
      t.integer :leader_id
      t.integer :company_id
      t.timestamps
    end
  end
end
