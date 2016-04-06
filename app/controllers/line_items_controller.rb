class LineItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity]
    @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => @quantity, :unit_price => @product.price)
    flash[:notice] = "Added #{@product.title} to cart."
    #redirect_to current_cart_url
    redirect_to '/cart'
  end
end