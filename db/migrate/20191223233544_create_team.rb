class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :company_id
      t.string :name
    end
  end
end
