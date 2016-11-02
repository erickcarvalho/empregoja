class JobsController < ApplicationController

  def show
    id = params[:id]
    @job = Job.find(id)
  end

  def new
    @job = Job.new
  end

  def create
    job_param = params.require(:job).permit(:title, :company_id, :category, :description, :location, :featured)
    @job = Job.new(job_param)
    # job = Job.create(job_param)

    if @job.save
      redirect_to @job
    else
      flash[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end
end
