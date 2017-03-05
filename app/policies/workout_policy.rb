 class WorkoutPolicy < ApplicationPolicy

  def update?
    user.admin? || record.try(:user) == user
  end

 end