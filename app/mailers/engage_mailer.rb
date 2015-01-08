class EngageMailer < ApplicationMailer

  def notice_email(user, engage)
    @user = user
    @engage = engage
    @engageable = engage.engageable_type.constantize.find(engage.engageable_id)
    @engage_type = @engage.engageable_type == "Job" ? "구직신청서" : "인터뷰요청"

    # 댓글을 작성한 당사자와 해당 댓글의 대상글을 작성한 사람에게 이메일 통보
    mail(to: @user.email, subject: '[The Wants] 댓글이 성공적으로 작성되었습니다.')
  end
end
