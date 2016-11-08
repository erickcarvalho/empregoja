class JobsController < ApplicationController

  before_action :load_collections

  def show
    id = params[:id]
    @job = Job.find(id)
  end

  def new
    @job = Job.new
  end

  def create

    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      flash[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit
    id = params[:id]
    @job = Job.find(id)
  end

  def update
    id = params[:id]
    @job = Job.find(id)

    if @job.update(job_params)
      redirect_to @job
    else
      flash[:error] = "Não foi possível atualizar a vaga"
      render :new
    end
  end

  private

  def job_params
    job_param = params.require(:job).permit(:title, :company_id, :category_id, :description, :location, :featured)
  end

  def load_collections
    @categories = Category.all
    @companies = Company.all
  end
end

# scaffold
