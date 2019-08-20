class LikesController < ApplicationController
  before_action :find_product, :already_liked?, only: [:destroy]
  
   def create
      if already_liked?
          flash[:notice] = "you can't like more than once "
      else 
        @product=Product.find(params[:product_id])
        @product.likes.create(user_id:  current_user.id) 
     end
    redirect_to root_path 
   end

  def destroy
    @product=Product.find(params[:product_id])

    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
      @like.delete
    end
    redirect_to root_path 
  end


   private
   def find_product
    @product=Product.find(params[:product_id])
   end

  def already_liked?
   @like = Like.where(user_id: current_user.id, product_id: params[:product_id]).exists?
  end
end