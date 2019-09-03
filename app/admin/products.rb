ActiveAdmin.register Product do

  permit_params :number, :date, :location, 
    :availability, :price, :is_sold_out

  index do
    selectable_column
    column :number
    column :date
    column :availability
    column "Sold Out", :is_sold_out
    actions
  end

  form do |f|
    f.inputs "Tour info" do
      f.input :number
      f.input :date
      f.input :location
      f.input :availability
      f.input :price
    end

    f.inputs "Sold out" do
      f.input :is_sold_out, label: "Sold Out"
    end

    f.actions
  end
  
end
