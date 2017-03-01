class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :name
      t.integer :user_id
      t.boolean :public

      t.timestamps null: false
    end
  end
end
