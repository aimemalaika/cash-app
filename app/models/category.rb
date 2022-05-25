class Category < ApplicationRecord
  has_many :categories_expenses
  has_many :expenses, through: :categories_expenses
  include ImageUploader::Attachment.new(:icon)

  validates :Name, presence: true, uniqueness: true
  validates :icon, presence: true
end
