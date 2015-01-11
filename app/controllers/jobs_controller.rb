class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  layout 'main'

  respond_to :html

  def index
    @jobs = Job.order(created_at: :desc)
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
    authorize_action_for @job
  end

  def create
    @job = Job.new(job_params)
    authorize_action_for Job
    @job.user = current_user
    @job.save
    respond_with(@job)
  end

  def update
    authorize_action_for @job
    @job.update(job_params)
    respond_with(@job)
  end

  def destroy
    authorize_action_for @job
    @job.destroy
    respond_with(@job)
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :content, :company, :homepage, :intro, :from, :to, :always, :contact, :user_id, engage_status_attributes:[:started_status])
    end
end
