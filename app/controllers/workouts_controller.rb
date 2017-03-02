require 'pry'
class WorkoutsController < ApplicationController

  def index
    @workouts = current_user.workouts
  end

  def new
    @user = current_user
    @workout = Workout.new 
    @workout.focuses.build
  end

  def create
    #raise params.inspect
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to user_workout_path(current_user, @workout)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end


  private

    def workout_params
      params.require(:workout).permit(:name, :description, :public, :duration, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
