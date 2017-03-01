class RemoveStartTimeFromFocuses < ActiveRecord::Migration
  def change
    remove_column :focuses, :start_time, :time 
    remove_column :focuses, :end_time, :time 
  end
end
