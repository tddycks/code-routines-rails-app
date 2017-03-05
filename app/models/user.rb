class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :admin]
  has_many :workouts
  has_many :focuses, through: :workouts

  after_initialize :set_user_role

  #validates_uniqueness_of :username

  def set_user_role
    self.role ||= :user
  end

end
