class AddIconColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :icon, :string
    add_column :groups, :icon, :string
  end
end
