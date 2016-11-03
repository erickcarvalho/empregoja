class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def show
    id = params[:id]
    @company = Company.find(id)
  end

  def create
    company_param = params.require(:company).permit(:name, :location, :mail, :phone)
    @company = Company.new(company_param)

    if @company.save
      redirect_to @company
    else
      flash[:error] = 'Não foi possível criar a empresa'
      render :new
    end

  end

end
