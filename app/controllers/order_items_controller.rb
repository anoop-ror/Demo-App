class OrderItemsController < ApplicationController

  def create
    @order=current_order
    
  end
  def destroy
   
  end

  private
  def order_item_params

  end


end
