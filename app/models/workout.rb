class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :focus_workouts
  has_many :focuses, through: :focus_workouts
end
