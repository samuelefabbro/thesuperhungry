class PagesController < ApplicationController

    def home
        @products = Product.all
    end

    def info
    end

end
