class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def show
    id = params[:id]
    @company = Company.find(id)
  end

  def create

    @company = Company.new(company_params)

    if @company.save
      redirect_to @company
    else
      flash[:error] = 'Não foi possível criar a empresa'
      render :new
    end

  end

  def edit
    id = params[:id]
    @company = Company.find(id)
  end

  def update
    id = params[:id]
    @company = Company.find(id)

    if @company.update(company_params)
      flash[:success] = 'Altearação realizada'
      redirect_to @company
    else
      flash[:error] = 'Não é possível salvar'
      render :edit
    end

  end

private

  def company_params
    company_param = params.require(:company).permit(:name, :location, :mail, :phone)
  end

end
