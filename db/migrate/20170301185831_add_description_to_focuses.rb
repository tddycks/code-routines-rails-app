class AddDescriptionToFocuses < ActiveRecord::Migration
  def change
    add_column :focuses, :description, :text
    add_column :focuses, :duration, :integer
  end
end
