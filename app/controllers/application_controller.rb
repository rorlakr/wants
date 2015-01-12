class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :counts
  before_action :engage_status
  layout :layout_by_resource

  # Send 'em back where they came from with a slap on the wrist
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => "#{view_context.fa_icon('exclamation-triangle')}[권한제한] 죄송합니다. 작업을 수행할 수 없습니다.<br />이와 관련된 질문 사항은 <a href='mailto:rorlab@gmail.com'>관리자</a>에게 이메일로 해 주시기 바랍니다."
  end

private

  def counts
    @all_jobs = EngageStatus.where( engage_on_type: 'Job' ).where( started_status: '1')
    @all_workers = EngageStatus.where( engage_on_type: 'Worker' ).where( started_status: '1')
  end

  def engage_status
    @engage_statuses = EngageStatus.order(created_at: :desc)
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) << [:login, :username]
    devise_parameter_sanitizer.for(:account_update) << :username
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

end
