class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :user_id
      t.boolean :public

      t.timestamps null: false
    end
  end
end
