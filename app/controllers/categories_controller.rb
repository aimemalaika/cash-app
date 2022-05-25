class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to categories_path
    else
      flash[:error] = 'Category not created'
      render 'new'
    end
  end

  def category_params
    params.require(:category).permit(:Name, :icon)
  end
end