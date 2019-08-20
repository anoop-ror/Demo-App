class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def price
    if presisted?
      self[:price]
    else
      product.price
    end
  end

  def total_price
    price*quentit    
  end

  private
  def product_present
    if product.nil
      errors.add(:product, "is not vaild ")
    end
  end

   def order_present
    if order.nil
      errors.add(:order, "is not vaild ")
    end
  end

end