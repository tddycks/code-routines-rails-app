class FocusesController < ApplicationController

  def edit
    @focus = Focus.find_by(id: params[:id])
    @workout = Workout.find_by(id: params[:workout_id])
  end

  def update
    @focus = Focus.find_by(id: params[:id])
    if @focus.update(focus_params)
      redirect_to user_workout_path(current_user, params[:workout_id])
    else
      @workout = Workout.find_by(id: params[:workout_id])
      render :edit
    end
  end

  def destroy
    Focus.find_by(id: params[:id]).destroy
    redirect_to user_workout_path(current_user, params[:workout_id])
  end


  private 

    def focus_params
      params.require(:focus).permit(:name, :description, :duration)
    end
end
