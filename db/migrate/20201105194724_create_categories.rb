class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :group_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
