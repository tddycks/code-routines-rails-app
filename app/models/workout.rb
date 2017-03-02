class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :focus_workouts
  has_many :focuses, through: :focus_workouts
  accepts_nested_attributes_for :focuses

  def focuses_attributes=(focuses_hashes)
    focuses_hashes.each do |index, focus_attributes|
      if focus_attributes[:name].present?
        focus = Focus.find_or_create_by(name: focus_attributes[:name])
        if !self.focuses.include(focus)
          self.focus_workouts.build(focus: focus)
        end
      end
    end
  end
end
