class AddPimageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pimage, :string
    add_column :products, :is_type, :boolean,  default: false
    add_column :products, :is_female, :boolean,  default: false
  end
end
