class CreateCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
          t.string :name
          t.string :about
          t.string :location
          t.boolean :premium, default: false
          t.timestamps
    end
  end
end
