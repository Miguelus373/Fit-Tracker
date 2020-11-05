class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :Name
      t.string :Icon
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :groups, :users, column: :user_id
  end
end
