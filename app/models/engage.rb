class Engage < ActiveRecord::Base

  resourcify
  include Authority::Abilities

  belongs_to :engageable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user

  validates :content, presence: { message: "내용을 입력해 주십시요."}
end
