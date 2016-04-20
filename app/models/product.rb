class Product < ActiveRecord::Base
  validates :title, presence: true, length: {minimum:2, maximum:50}
  validates :description, presence: true, length: {minimum:10, maximum:1024}
  validates :price, numericality: {greater_than_or_equal_to: 0} # remember 0 price is a free item!
  validates :stock, numericality: {greater_than_or_equal_to: 0}
  has_many :screenshots
  accepts_nested_attributes_for :screenshots, :allow_destroy => true
end
