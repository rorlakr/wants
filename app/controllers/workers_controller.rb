class WorkersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  layout 'main'
  respond_to :html, :js

  def index
    @workers = Worker.all
    respond_with(@workers)
  end

  def show
    @profile = @worker.user.profile
    respond_with(@worker)
  end

  def new
    @worker = Worker.new
    @remote = true
    if current_user.profile
      @profile = current_user.profile
    else
      @profile = current_user.build_profile
    end
    respond_with(@worker)
  end

  def edit
    @remote = true
    if current_user.profile
      @profile = current_user.profile
    else
      @profile = current_user.build_profile
    end
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.user = current_user
    @worker.save
    respond_with(@worker)
  end

  def update
    @worker.update(worker_params)
    respond_with(@worker)
  end

  def destroy
    @worker.destroy
    respond_with(@worker)
  end

  private
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:title, :content, :user_id, )
    end

end
