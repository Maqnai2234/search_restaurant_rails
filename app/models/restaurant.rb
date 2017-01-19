class Restaurant < ApplicationRecord
  validates :name, :image, presence: true
  mount_uploader :image, ImageUploader
  has_many :zones
end
