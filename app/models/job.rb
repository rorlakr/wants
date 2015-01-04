class Job < ActiveRecord::Base
  belongs_to :user
  has_many :engages, as: :engageable, dependent: :destroy

  validates :title, :content, presence: true
end
