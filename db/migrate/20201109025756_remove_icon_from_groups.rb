class RemoveIconFromGroups < ActiveRecord::Migration[6.0]
  def changer
    remove_column :groups, :icon
  end
end
