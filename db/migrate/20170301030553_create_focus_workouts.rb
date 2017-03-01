class CreateFocusWorkouts < ActiveRecord::Migration
  def change
    create_table :focus_workouts, :id => false do |t|
      t.integer :focus_id
      t.integer :workout_id

      t.timestamps null: false
    end
  end
end
