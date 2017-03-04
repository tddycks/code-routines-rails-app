class Focus < ActiveRecord::Base
  has_many :focus_workouts
  has_many :workouts, through: :focus_workouts

  validates_presence_of :name
end
