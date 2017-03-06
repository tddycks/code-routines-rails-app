module WorkoutsHelper

  def current_user_workout?
    current_user == @workout.user || current_user.role == 'admin'
  end
end
