class JobsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :destroy, :edit, :update, :create]

  def index
    @jobs = case params[:order]
     when "by_lower_bound"
       Job.where(:is_hidden => false).order("wage_lower_bound DESC")
     when "by_upper_bound"
       Job.where(:is_hidden => false).order("wage_upper_bound DESC")
     else
       Job.where(:is_hidden => false).order("created_at DESC")
     end
  end

  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    
    if @job.is_hidden
        flash[:warning] = "This Job already archived"
        redirect_to jobs_path
    end
  end

 


end
