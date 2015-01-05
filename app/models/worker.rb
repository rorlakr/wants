class Worker < ActiveRecord::Base

  resourcify
  include Authority::Abilities
  self.authorizer_name = 'BasicAuthorizer'

  belongs_to :user
  has_many :engages, as: :engageable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :content, presence: true

end
