class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  enum role: [:user, :admin]
  has_many :workouts
  has_many :focuses, through: :workouts

  after_initialize :set_user_role

  def set_user_role
    self.role ||= :user
  end

  def self.most_active
    user = self.all.max_by { |u| u.workouts.count }
  end

  def self.from_omniauth(auth)  
    #raise auth.inspect
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
    end
  end

end
