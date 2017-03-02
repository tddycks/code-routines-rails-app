require 'pry'
class WorkoutsController < ApplicationController

  def index
  end

  def new
    @user = current_user
    @workout = Workout.new 
    @workout.focuses.build
  end

  def create
    raise params.inspect

  end


  private

    def workout_params
      params.require(:workout).permit(:name, :description, :public, focus_ids:[], focuses_attributes: [:name, :description, :duration])
    end

end
