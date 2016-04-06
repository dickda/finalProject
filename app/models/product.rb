class Product < ActiveRecord::Base
  validates :title, presence: true, length: {minimum:2, maximum:50}
  validates :description, presence: true, length: {minimum:10, maximum:1024}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :stock, numericality: {greater_than_or_equal_to: 0}
  mount_uploader :images, ImageUploader
  serialize :images
end
