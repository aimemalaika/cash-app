class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def destroy; end

  def create
    @category = params[:expense][:category_ids]
    @new_expense = current_user.expenses.create(expense_params)
    @category.each do |category|
      @categories_expenses = CategoriesExpense.create(expense_id: @new_expense.id, category_id: category)
    end
    if @new_expense.save && @categories_expenses.save
      redirect_to root_path
    else
      render :new
    end
  end

  def expense_params
    params.require(:expense).permit(:Name, :Amount)
  end
end
