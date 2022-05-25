class AddExpensesToCategoriesExpense < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories_expenses, :expense, null: false, foreign_key: { to_table: :expenses }
  end
end
