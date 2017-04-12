class JobsController < ApplicationController

  before_action :authenticate_user!, only:[:new]

  def index
    @jobs = Job.all
  end

  

end
