class User < ActiveRecord::Base

  rolify

  # Adds `can_create?(resource)`, etc
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :async,
         :authentication_keys => [:login]

  has_one :profile, dependent: :destroy
  has_many :engages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :works, dependent: :destroy

  attr_accessor :login
  validates :username,
    :uniqueness => {
      :case_sensitive => false
    },
    :format => { with: /\A[a-zA-Z0-9]+\Z/ }

  # Override Devise::Confirmable#after_confirmation
  def after_confirmation
    self.add_role :user
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
