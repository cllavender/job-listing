class Company::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :index]
  before_action :require_is_company_admin
  before_action :require_is_company_user

    def index
      @jobs = current_user.jobs.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    end

   def show
    @job = Job.find(params[:id])
   end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
       redirect_to company_jobs_path
     else
       render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_jobs_path, notice: "Update success!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to company_jobs_path, alert: "Job deleted!"
  end

  def require_is_company_admin
    unless current_user.company_admin?
      flash[:alert] = 'You are not company admin'
      redirect_to root_path
    end
  end


    def require_is_company_user
      unless current_user.company_user?
        flash[:alert] = 'You are not a user of company'
        redirect_to root_path
      end
    end

  def publish
    @job = Job.find(params[:id])
    @job.publish!

    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!

    redirect_to :back
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :company_name, :job_type, :location)
  end



end
