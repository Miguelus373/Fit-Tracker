class AddColumnsToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :distance, :float
    add_column :exercises, :time, :integer
  end
end
