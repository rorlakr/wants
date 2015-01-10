class User < ActiveRecord::Base

  rolify

  # Adds `can_create?(resource)`, etc
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  has_one :profile, dependent: :destroy
  has_many :engages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :works, dependent: :destroy

  # Override Devise::Confirmable#after_confirmation
  def after_confirmation
    self.add_role :user
  end

end
