class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :categories_expenses, dependent: :delete_all
  has_many :categories, through: :categories_expenses
end
