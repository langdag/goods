class ImportProductsWorker
    require 'csv'
    include Sidekiq::Worker
    sidekiq_options retry: false
  
    def perform(path)
      CSV.foreach(path, headers: true) do |data|
        if Product.exists?(sku: data[0])
          @product = Product.find_by(sku: data[0])
          @product.update(supplier_code: data[1], name: data[2], price: data[8])
        else
          Product.create(sku: data[0], supplier_code: data[1], name: data[2], price: data[8])
        end
      end
      #if csv_file.original_filename == 'suppliers.csv'
      #  CSV.foreach(csv_file, headers: true) do |data|
      #    if Supplier.exists?(code: data[0])
      #      @supplier = Supplier.find_by(code: data[0])
      #      @supplier.update(name: data[1])
      #    else
      #      Supplier.create(code: data[0], name: data[1])
      #    end
      #  end
      #else
      #  CSV.foreach(csv_file, headers: true) do |data|
      #    if Product.exists?(sku: data[0])
      #      @product = Product.find_by(sku: data[0])
      #      @product.update(supplier_code: data[1], name: data[2], price: data[8])
      #    else
      #      Product.create(sku: data[0], supplier_code: data[1], name: data[2], price: data[8])
      #    end
      #  end
      #end 
   end
end