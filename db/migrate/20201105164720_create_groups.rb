class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :Name
      t.string :Icon
      t.integer :user_id

      t.timestamps
    end
  end
end
