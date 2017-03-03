class ChangePublictoPrivateWorkouts < ActiveRecord::Migration
  def change
    rename_column :workouts, :public, :private
  end
end
