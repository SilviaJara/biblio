class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.date :pub_date
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
