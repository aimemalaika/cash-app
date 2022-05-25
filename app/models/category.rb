class Category < ApplicationRecord
  include ImageUploader::Attachment.new(:icon)

  validates :Name, presence: true, uniqueness: true
  validates :icon, presence: true
end
