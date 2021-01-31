class ImportProductsWorker
    require 'csv'
    include Sidekiq::Worker
    sidekiq_options retry: false
  
    def perform(filepath, filename)
      if filename == 'suppliers.csv'
        CSV.foreach(filepath, encoding: Encoding::ISO_8859_1, col_sep: "\xC2\xA6".force_encoding(Encoding::ISO_8859_1)) do |row|
         data = {
            code: row[0],
            name: row[1]
          }
          Supplier.where(code: row[0]).first_or_create!(data).update(data)
        end
      else
        CSV.foreach(filepath, encoding: Encoding::ISO_8859_1, col_sep: "\xC2\xA6".force_encoding(Encoding::ISO_8859_1)) do |row|
          data = {
             sku: row[0],
             supplier_code: row[1],
             name: row[2],
             price: row[8]
          }
          Product.where(sku: row[0]).first_or_create!(data).update(data)
        end
      end
   end
end