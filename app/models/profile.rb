class Profile < ActiveRecord::Base
  belongs_to :user

  validates :alias_name, :phone, presence: true
  validates :alias_name, uniqueness: true

end
