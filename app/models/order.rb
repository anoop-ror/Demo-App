class Order < ApplicationRecord


   before_save :update_subtotal
  
  def sub_total
      order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def update_subtotal
    p "subtotaol == ", self[:subtotal] = subtotal
  end

  def update_total
    self.update_attribute(:subtotal, subtotal)
  end


end
