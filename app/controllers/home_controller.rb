class HomeController < ApplicationController
    def index
      @products = Product.all
      @suppliers = Supplier.all
    end
end
