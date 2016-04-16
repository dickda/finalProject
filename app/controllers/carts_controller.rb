class CartsController < ApplicationController
  def show
    @cart = current_cart
  end
  
  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Cart was successfully emptied.' }
      format.json { head :no_content }
    end
  end
end