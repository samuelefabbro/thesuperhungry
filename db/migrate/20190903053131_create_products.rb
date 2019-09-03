class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :number
      t.string :date
      t.string :location
      t.integer :availability
      t.integer :price
      t.boolean :is_sold_out, default: false 

      t.timestamps
    end
  end
end
