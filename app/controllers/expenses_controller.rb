class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.order(created_at: :desc)
    @total_amount = @expenses.sum(:Amount)
  end

  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to categories_path
  end

  def create
    @category = params[:expense][:category_ids]
    @new_expense = current_user.expenses.create(expense_params)
    @category.each do |category|
      @categories_expenses = CategoriesExpense.create(expense_id: @new_expense.id, category_id: category)
    end
    if @new_expense.save && @categories_expenses.save
      flash[:success] = 'Expense was successfully created.'
      redirect_to categories_path
    else
      flash[:error] = "Expense was not created. du to #{@new_expense.errors.full_messages}"
      render :new
    end
  end

  def expense_params
    params.require(:expense).permit(:Name, :Amount)
  end
end
