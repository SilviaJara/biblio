class AddStockToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :stock, :integer, :default => 0, :null => 0
  end
end
