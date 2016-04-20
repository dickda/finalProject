class CartsController < ApplicationController
  #The creation action happens in the application controler, which allows the cookie to be set right away.
  
  
  def show
    @cart = current_cart
  end
  
  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    #need to first destroy each of the line items
    @cart.line_items.each do |i|
      i.destroy
    end
    #now destroy the cart and set the cookie to nil so that it will request a new cookie.
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Cart was successfully emptied.' }
      format.json { head :no_content }
    end
  end
end