class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :AuthorId
      t.string :Name
      t.integer :Amount

      t.timestamps
    end
  end
end
