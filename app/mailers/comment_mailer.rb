class CommentMailer < ApplicationMailer

  def comment_notice_email(user, comment)
    @user = user
    @comment = comment
    @commentable = comment.commentable_type.constantize.find(comment.commentable_id)
    @commentable = @commentable.engageable_type.constantize.find(@commentable.engageable_id) if @commentable.respond_to?(:engageable_type)

    # 댓글을 작성한 당사자와 해당 댓글의 대상글을 작성한 사람에게 이메일 통보
    mail(to: @user.email, subject: '[The Wants] 댓글이 성공적으로 작성되었습니다.')
  end

end
