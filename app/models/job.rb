class Job < ActiveRecord::Base
  belongs_to :user
  has_many :engages, as: :engageable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :content, presence: true
end
