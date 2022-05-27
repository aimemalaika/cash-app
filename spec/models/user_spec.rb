require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(Name: 'John doe', email: 'john@gmail.com', password: 123_456, password_confirmation: 123_456)
  end

  describe 'model' do
    it 'should be a valid name' do
      @user.Name = 'John doe'
      expect(@user).to be_valid
    end

    it 'should have valid email' do
      @user.email = 'john@gmail.com'
      expect(@user).to be_valid
    end

    it 'should have valid password' do
      @user.password = 123_456
      expect(@user).to be_valid
    end

    it 'should have valid password confirmation' do
      @user.password_confirmation = 123_456
      expect(@user).to be_valid
    end

    it 'should not be valid without a name' do
      @user.Name = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a password confirmation' do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
  end
end
