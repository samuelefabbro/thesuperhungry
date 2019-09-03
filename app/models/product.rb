class Product < ApplicationRecord

    validates :number, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :availability, presence: true
    validates :price, presence: true
    
end
