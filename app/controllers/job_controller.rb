class JobController < ApplicationController
  def show
    id = params[:id]
    @job = Job.find(id)
  end

  def new
    @new_job = Job.new
  end

  def create
    job_param = params.require(:job).permit(:title, :company, :category, :description, :location)
    job = Job.create(job_param)
    redirect_to job
  end
end
