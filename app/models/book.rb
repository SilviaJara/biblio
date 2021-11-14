class Book < ApplicationRecord
  belongs_to :autor
  has_many :category_books
  has_many :categories, through: :category_books

  has_many :book_lends
  has_many :users, through: :book_lends


  validates :name, :pub_date, presence: true
end
