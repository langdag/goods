class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
    
    def upload_csv
      ImportProductsWorker.perform_async(product_params[:file].path)
      redirect_to root_path, notice: 'All Data have been uploaded!'
    end

    private

    def product_params
      params.permit(:file)
    end
end
