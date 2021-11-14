class ChangoBookLendsDevueltoDefaults < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:book_lends, :devuelto, false)
  end
end
