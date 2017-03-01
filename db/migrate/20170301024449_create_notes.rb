class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :focus_id

      t.timestamps null: false
    end
  end
end
