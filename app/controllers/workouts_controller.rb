require 'pry'
class WorkoutsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update]
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @workouts = @user.workouts
  end

  def new
    @workout = Workout.new 
    #raise @workout.inspect
    #authorize @workout
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
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to user_workout_path(@user, @workout)
    else
      render :edit
    end
  end

  def destroy
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

    def authorize_user
      authorize @workout
    end

    def workout_params
      params.require(:workout).permit(:name, :description, :private, :duration, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
