class AddNewcolumnToDemons < ActiveRecord::Migration[5.2]
  def change
    add_column :demons, :slayed?, :boolean
  end
end
