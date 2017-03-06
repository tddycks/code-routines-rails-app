module WorkoutsHelper

  def current_user_workout?
    current_user == @workout.user 
  end
end
