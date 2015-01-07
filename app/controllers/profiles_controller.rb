class ProfilesController < ApplicationController
  before_action :authenticate_user!
  layout 'profiles'

  def new
    @profile = User.find(params[:user_id]).build_profile
    @remote = false
  end

  def edit
    @profile = User.find(params[:user_id]).profile
    @remote = false

  end

  def show
    @profile = User.find(params[:user_id]).profile

  end

  def create
    @profile = User.find(params[:user_id]).build_profile(profile_params)
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
    @profile = User.find(params[:user_id]).profile

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
    @profile = User.find(params[:user_id]).profile
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
    params.require(:profile).permit( :profile_image, :profile_image_cache_id, :remove_profile_image, :remote_profile_image_url, :real_name, :alias_name, :phone, :homepage, :twitter, :facebook, :linkedin, :salary_requirement, :job_status, :job_status_etc, :dev_languages, :dev_duration, :dev_web, :dev_system, :dev_smart, :dev_history, :community_activity, :book_author, :book_trans, :published)
  end

end
