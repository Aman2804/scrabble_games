class AddFieldToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :participation, :integer, default: 0
  end
end
