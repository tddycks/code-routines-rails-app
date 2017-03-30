class FavoritesController < ApplicationController

  def create
    #raise params.inspect
    @favorite = Favorite.create(favorite_params)
    redirect_to user_workout_path(@favorite.workout.user, @favorite.workout)
  end


  private 

    def favorite_params
      params.require(:favorite).permit(:user_id, :workout_id)
    end

end
