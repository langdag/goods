class Supplier < ApplicationRecord
  has_many :products, primary_key: :code, foreign_key: :supplier_code
end
