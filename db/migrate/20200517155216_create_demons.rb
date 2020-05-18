class CreateDemons < ActiveRecord::Migration[5.0]
  def change
    create_table :demons do |t|
      t.string :name
      t.integer :health
      t.integer :strength, default: 20
      t.string :description
    end
  end
end
