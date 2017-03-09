class FocusWorkout < ActiveRecord::Base

  belongs_to :focus
  belongs_to :workout
  
end
