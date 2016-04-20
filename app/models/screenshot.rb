class Screenshot < ActiveRecord::Base
  belongs_to :product_params
  mount_uploader :image, ImageUploader
  # we do image vlidation on the image uploader side
end
