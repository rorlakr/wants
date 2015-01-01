class Job < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, :company, :intro, :contact, presence: true
end
