require 'pry'
class WorkoutsController < ApplicationController

  def index
    @workouts = current_user.workouts
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @workout = Workout.new 
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to user_workout_path(current_user, @workout)
    else
      @user = User.find_by(id: params[:user_id])
      render :new
    end
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @workout = Workout.find_by(id: params[:id])
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    if @workout.update(workout_params)
      redirect_to user_workout_path(current_user, @workout)
    else
      @user = User.find_by(id: params[:user_id])
      render :edit
    end
  end

  def destroy
    #raise params.inspect
    workout = Workout.find_by(id: params[:id])
    workout.destroy
    redirect_to user_workouts_path(current_user)
  end


  private

    def workout_params
      params.require(:workout).permit(:name, :description, :public, :duration, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
