class HomeController < ApplicationController

  def index
    if user_signed_in?
      @workouts = Workout.all
    else
      render 'static/index' 
    end
  end
  
end
