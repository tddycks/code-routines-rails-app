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

end
