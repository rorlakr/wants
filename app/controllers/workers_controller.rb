class WorkersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  layout 'main'
  respond_to :html, :js

  def index
    @workers = Worker.order(created_at: :desc)
    respond_with(@workers)
  end

  def show
    respond_with(@worker)
  end

  def new
    @worker = Worker.new
    @worker.user = current_user
    @remote = true
    if @worker.user.profile
      @profile = @worker.user.profile
    else
      @profile = @worker.user.build_profile
    end
    respond_with(@worker)
  end

  def edit
    authorize_action_for @worker
    @remote = true
    if @worker.user.profile
      @profile = @worker.user.profile
    else
      @profile = current_user.build_profile
    end
    respond_with(@worker)
  end

  def create
    authorize_action_for Worker
    @worker = Worker.new(worker_params)
    @worker.user = current_user
    @worker.save
    respond_with(@worker)
  end

  def update
    authorize_action_for @worker
    @worker.update(worker_params)
    respond_with(@worker)
  end

  def destroy
    authorize_action_for @worker
    @worker.destroy
    respond_with(@worker)
  end

  private
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:title, :content, :user_id, engage_status_attributes:[:started_status])
    end

end
