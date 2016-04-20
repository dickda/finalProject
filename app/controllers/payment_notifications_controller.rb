class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  # POST /payment_notifications
  # POST /payment_notifications.json

  
  def create
    PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    #if a payment notification has been entered we need to subtract it from the number in the stock
    subtractProducts( params[:invoice], :status)
    render :nothing => true
  end
  
  def subtractProducts (cart_id, status)
    if status != "Completed"
      lineItmes = LineItem.where(:cart_id => cart_id)
      lineItmes.each do |li|
        product_id = li.product_id
        logger.info product_id
        p = Product.find(product_id)
        p.stock = p.stock - li.quantity
        logger.info  p.stock 
        p.save!
     end
     
    end
    
  end  
    
  
  
end
