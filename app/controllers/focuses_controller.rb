class FocusesController < ApplicationController
  before_action :set_focus, only: [:edit, :update, :destroy]
  before_action :set_workout, only: [:edit, :update]

  def edit
  end

  def update
    if @focus.update(focus_params)
      redirect_to user_workout_path(current_user, params[:workout_id])
    else
      render :edit
    end
  end

  def destroy
    @focus.destroy
    redirect_to user_workout_path(current_user, params[:workout_id])
  end


  private 

    def set_focus
      @focus = Focus.find_by(id: params[:id])
    end

    def set_workout
      @workout = Workout.find_by(id: params[:workout_id])
    end

    def focus_params
      params.require(:focus).permit(:name, :description, :duration)
    end
end
