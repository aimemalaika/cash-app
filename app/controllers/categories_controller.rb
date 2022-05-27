class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to categories_path
    else
      flash[:error] = "Category was not created. du to #{@category.errors.full_messages}"
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.categories_expenses.each do |categories_expense|
      if CategoriesExpense.where(expense_id: categories_expense.expense_id).count == 1
        Expense.find(categories_expense.expense_id).destroy
      end
    end
    @category.destroy
    flash[:success] = 'Category deleted successfully'
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:Name, :icon)
  end
end
