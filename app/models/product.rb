class Product < ApplicationRecord

    has_many :order_items
    
    validates :number, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :availability, presence: true
    validates :price, presence: true
    
    def price_in_euros
        price / 100
    end


end
