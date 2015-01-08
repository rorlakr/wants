class Engage < ActiveRecord::Base

  resourcify
  include Authority::Abilities

  belongs_to :engageable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user

  validates :content, presence: { message: "내용을 입력해 주십시요."}

  def send_notification!(users)
    # EngageJob.perform_later(users, self)
    users.each do | user |
      EngageMailer.notice_email(user, self).deliver_later
    end
  end
end
