class Engage < ActiveRecord::Base
  belongs_to :engageable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user
end
