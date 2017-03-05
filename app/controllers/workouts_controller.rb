require 'pry'
class WorkoutsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update]

  def index
    @workouts = current_user.workouts
  end

  def new
    @workout = Workout.new 
  end

  def create
    @workout = @user.workouts.build(workout_params)
    if @workout.save
      redirect_to user_workout_path(@user, @workout)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end

  def edit
    @workout = Workout.find_by(id: params[:id])
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    if @workout.update(workout_params)
      redirect_to user_workout_path(@user, @workout)
    else
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

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def workout_params
      params.require(:workout).permit(:name, :description, :public, :duration, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
