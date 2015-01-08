class CommentJob < ActiveJob::Base
  queue_as :comment_email

  def perform(user, comment)
    CommentMailer.comment_notice_email(user, comment).deliver_now
    puts comment.inspect
  end
end