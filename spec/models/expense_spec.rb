require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:all) do
    @user = User.new(Name: 'John doe', email: 'john@gmail.com', password: 123_456, password_confirmation: 123_456)
    @expenses = Expense.new(Name: 'Grocessist', Amount: 100, author: @user)
  end

  describe 'model' do
    it 'should be a valid name' do
      @expenses.Name = 'Grocessist'
      expect(@expenses).to be_valid
    end

    it 'should have valid Amount' do
      @expenses.Amount = 100
      expect(@expenses).to be_valid
    end

    it 'should not be valid without a name' do
      @expenses.Name = nil
      expect(@expenses).to_not be_valid
    end

    it 'should not be valid without a Amount' do
      @expenses.Amount = nil
      expect(@expenses).to_not be_valid
    end
  end
end
