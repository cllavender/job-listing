class JobsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :destroy, :edit, :update, :create]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @job = Job.find(params[:id])
  end

 


end
