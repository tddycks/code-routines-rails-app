class AddDescriptionToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :description, :text
    add_column :workouts, :duration, :string
  end
end
