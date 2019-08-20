class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :unit
      t.string :city
      t.string :state
      t.integer :Pincode
      t.integer :phone

      t.timestamps
    end
  end
end
