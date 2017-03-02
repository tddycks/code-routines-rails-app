require 'pry'
class WorkoutsController < ApplicationController

  def index
  end

  def new
    @user = current_user
    @workout = Workout.new
    #2.times do 
      @workout.focuses.build
    #end
  end

  def create
    raise params.inspect
  end

end
