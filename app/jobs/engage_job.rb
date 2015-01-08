class EngageJob < ActiveJob::Base
  queue_as :engage_email

  def perform(users, engage)
    users.each do | user |
      EngageMailer.notice_email(user, engage).deliver_now
    end
    puts engage.inspect
  end
end