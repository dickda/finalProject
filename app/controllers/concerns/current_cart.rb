# This allows all controllers to access the current cart to display it on the sidebar
module CurrentCart
  extend ActiveSupport::Concern
  
  private
  
  def set_cart
   #session[:cart_id] ||= Cart.create!.id
      #@current_cart ||= Cart.find(session[:cart_id])
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end