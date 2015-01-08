class CommentMailer < ApplicationMailer

  def comment_notice_email(user, comment)
    @user = user
    @comment = comment
    mail(to: @user.email, subject: '[The Wants] 댓글이 성공적으로 작성되었습니다.')
  end

end
