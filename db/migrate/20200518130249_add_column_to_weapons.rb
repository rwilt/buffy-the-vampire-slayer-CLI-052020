class AddColumnToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :user_id, :integer
  end
end
