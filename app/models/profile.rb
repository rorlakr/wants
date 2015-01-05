class Profile < ActiveRecord::Base
  resourcify
  # Adds `creatable_by?(user)`, etc
  include Authority::Abilities
  belongs_to :user

  validates :alias_name, :phone, presence: true
  validates :alias_name, uniqueness: true

end
