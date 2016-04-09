class AddScreenshotToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :screenshot, index: true, foreign_key: true
  end
end
