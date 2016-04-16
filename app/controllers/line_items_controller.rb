class LineItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity]
    @line_item = LineItem.new(:cart => current_cart, :product => @product, :quantity => @quantity, :unit_price => @product.price)
       
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @product, notice: "Added  to cart."  }
        format.js   { @current_item = @line_item }
        format.json { render acton: 'show', status: :created, location: @line_item }
      else
         format.hrml {render action 'new'}
         format.json {render json: @line_item.errors, status: :unprocessable_entity }
      end
   end
    #redirect_to current_cart_url
    #redirect_to '/cart'
  end
end