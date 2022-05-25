class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def destroy
  end

  def create
    @new_expense = current_user.expenses.create(expense_params)
    # @new_expense.categories = Category.find(params[:expense][:category_ids])
    if @new_expense.save
      redirect_to root_path
    else
      pp @new_expense.errors.full_messages.to_sentence
    end
  end

  def expense_params
    params.require(:expense).permit(:Name, :category_ids, :Amount)
  end
end
