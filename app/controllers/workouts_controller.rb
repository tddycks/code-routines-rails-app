require 'pry'
class WorkoutsController < ApplicationController

  def index
    @workouts = current_user.workouts
  end

  def new
    @user = current_user
    @workout = Workout.new 
  end

  def create
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

  def edit
    @user = current_user
    @workout = Workout.find_by(id: params[:id])
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    if @workout.update(workout_params)
      redirect_to user_workout_path(current_user, @workout)
    else
      render :edit
    end
  end


  private

    def workout_params
      params.require(:workout).permit(:name, :description, :public, :duration, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
