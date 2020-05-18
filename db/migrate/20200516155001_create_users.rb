class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :health, default: 10
      t.integer :strength, default: 15
      t.integer :MP, default: 10
      t.string :description
    end

  end
end
