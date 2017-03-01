class Focus < ActiveRecord::Base
  has_many :focus_workouts
  has_many :workouts, through: :focus_workouts
end
