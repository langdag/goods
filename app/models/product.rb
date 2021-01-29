class Product < ApplicationRecord
  belongs_to :supplier, foreign_key: :supplier_code
end
