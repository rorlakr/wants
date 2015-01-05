class User < ActiveRecord::Base

  rolify

  # Adds `can_create?(resource)`, etc
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
end
