class Product < ApplicationRecord
  belongs_to :supplier, foreign_key: :supplier_code 
  #if Supplier.exists?(code: data[0])
  #  @supplier = Supplier.find_by(code: data[0])
  #  @supplier.update(name: data[1])
  #else
  #  Supplier.create(code: data[0], name: data[1])
  #end
  #CSV.foreach(csv_file) do |data|
  #  if Product.exists?(sku: data[0])
  #    @product = Product.find_by(sku: data[0])
  #    @product.update(supplier_code: data[1], name: data[2], price: data[8])
  #  else
  #    Product.create(sku: data[0], supplier_code: data[1], name: data[2], price: data[8])
  #  end
  #end
      #if filename == 'suppliers.csv'
      #  CSV.foreach(filepath, encoding: Encoding::ISO_8859_1, col_sep: "\xC2\xA6".force_encoding(Encoding::ISO_8859_1)) do |row|
      #   data = {
      #      code: row[0],
      #      name: row[1]
      #    }
      #    binding.pry
      #    Supplier.where(code: row[0]).first_or_create(data).update(data)
      #  end
      #else
      #  CSV.foreach(filepath, encoding: Encoding::ISO_8859_1, col_sep: "\xC2\xA6".force_encoding(Encoding::ISO_8859_1)) do |row|
      #    data = {
      #       sku: row[0],
      #       supplier_code: row[1],
      #       name: row[2],
      #       price: row[8]
      #    }
      #    Product.where(sku: row[0]).first_or_create(data).update(data)
      #  end
      #end
end
