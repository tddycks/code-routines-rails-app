require 'pry'
class WorkoutsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update]
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = @user.workouts
  end

  def new
    authorize @workout
    @workout = Workout.new 
  end

  def create
    authorize @workout
    @workout = @user.workouts.build(workout_params)
    if @workout.save
      redirect_to user_workout_path(@user, @workout)
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @workout
  end

  def update
    authorize @workout
    if @workout.update(workout_params)
      redirect_to user_workout_path(@user, @workout)
    else
      render :edit
    end
  end

  def destroy
    authorize @workout
    @workout.destroy
    redirect_to user_workouts_path(current_user)
  end


  private

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_workout
      @workout = Workout.find_by(id: params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :description, :public, :duration, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
