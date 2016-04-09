class Screenshot < ActiveRecord::Base
  belongs_to :product_params
  mount_uploader :image, ImageUploader
end
