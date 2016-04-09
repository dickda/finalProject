class AddProductIdToScreenshot < ActiveRecord::Migration
  def change
    add_column :screenshots, :product_id, :integer
  end
end
