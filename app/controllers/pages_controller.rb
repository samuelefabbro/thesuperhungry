class PagesController < ApplicationController

    def home
        @available_products = Product.where(is_sold_out: false)
    end

    def info
    end

end
