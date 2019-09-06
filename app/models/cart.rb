class Cart < ApplicationRecord
    has_many :order_items

    def total_quantity
        @count = 0

        order_items.all.each do |item|
            @count = @count + item.quantity
        end

        @count
    end

    def total_price
        @total = 0

        order_items.all.each do |item|
            @total = @total + item.product.price * item.quantity
        end
    end

    def total_price_in_euros
        @total = 0
        
        order_items.all.each do |item|
            @total = @total + item.product.price_in_euros * item.quantity
        end

        @total

    end

end
