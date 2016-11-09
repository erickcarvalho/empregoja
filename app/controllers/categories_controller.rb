class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category_param = params.require(:category).permit(:name)
    @category = Category.new(category_param)

    if @category.save
      redirect_to @category
      flash[:success] = 'Categoria criada com sucesso'
    else
      flash[:error] = 'Não foi possivel salvar'
      render :new
    end
  end

  def show
    id = params[:id]
    @category = Category.find(id)
  end
end
