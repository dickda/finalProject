class ApplicationController < ActionController::Base
    include CurrentCart
    before_action :set_cart

  #allow for apis to bue used.
  protect_from_forgery with: :null_session
  def current_cart
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
