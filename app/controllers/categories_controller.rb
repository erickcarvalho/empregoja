class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category_param = params.require(:category).permit(:name)
    @category = Category.new(category_param)

    if @category.save
      redirect_to @category
    end
  end
end
