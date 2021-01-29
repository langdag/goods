class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers, primary_key: :code do |t|
      t.string :name

      t.timestamps
    end
  end
end
