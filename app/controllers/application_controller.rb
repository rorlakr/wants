class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :counts
  layout :layout_by_resource

  # Send 'em back where they came from with a slap on the wrist
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => "죄송합니다. 귀하는 접근 권한이 없습니다. 필요한 경우 권한을 부여 받으시기 바랍니다. <a href='mailto:rorlab@gmail.com'>관리자</a>"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def counts
    @all_jobs = Job.all
    @all_workers = Worker.all
  end
end
