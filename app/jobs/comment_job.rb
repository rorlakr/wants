class CommentJob < ActiveJob::Base
  queue_as :comment_email

  def perform(users, comment)
    users.each do | user |
      CommentMailer.comment_notice_email(user, comment).deliver_now
    end
    puts comment.inspect
  end
end