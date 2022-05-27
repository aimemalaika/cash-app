require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @categories = Category.new(Name: 'Food',
                               icon_data: {
                                 id: '44ed0c865daff3576dd9c3a03e560085.png',
                                 storage: 'store',
                                 metadata: {
                                   filename: 'doc002-pdf.png',
                                   size: 5303, mime_type: 'image/png'
                                 }
                               })
  end

  describe 'model' do
    it 'should be a valid name' do
      @categories.Name = 'Food'
      expect(@categories).to be_valid
    end

    it 'should have valid icon_data' do
      @categories.icon_data = {
        id: '44ed0c865daff3576dd9c3a03e560085.png',
        storage: 'store',
        metadata: {
          filename: 'doc002-pdf.png',
          size: 5303, mime_type: 'image/png'
        }
      }
      expect(@categories).to be_valid
    end

    it 'should not be valid without a name' do
      @categories.Name = nil
      expect(@categories).to_not be_valid
    end

    it 'should not be valid without a icon_data' do
      @categories.icon_data = nil
      expect(@categories).to_not be_valid
    end
  end
end
