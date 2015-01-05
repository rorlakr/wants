class Comment < ActiveRecord::Base

  resourcify
  include Authority::Abilities
  self.authorizer = BasicAuthorizer

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, presence: { message: "내용을 입력해 주십시요."}
end
