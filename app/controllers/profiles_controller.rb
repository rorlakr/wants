class ProfilesController < ApplicationController
  before_action :authenticate_user!
  layout 'main'

  def new
    @profile = current_user.build_profile
    @remote = false
  end

  def edit
    @profile = current_user.profile
    @remote = false

  end

  def show
    @profile = current_user.profile

  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      if request.xhr?
        respond_to do | format |
          format.js
        end
      else
        redirect_to [@profile.user, @profile], notice: '프로필이 생성되었습니다.'
      end
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      if request.xhr?
        respond_to do | format |
          format.js
        end
      else
        redirect_to user_profile_path, notice: '프로필이 변경되었습니다.'
      end
    else
      render :edit
    end
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy
    @profile = current_user.build_profile
    if request.xhr?
      respond_to do | format |
        format.js
      end
    else
      redirect_to root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit( :alias_name, :phone, :homepage, :twitter, :facebook, :linkedin, :salary_requirement, :job_status, :job_status_etc, :dev_languages, :dev_duration, :dev_web, :dev_system, :dev_smart, :dev_history, :community_activity, :book_author, :book_trans, :published)
  end
end
