class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EXPRESION_REGULAR_TELEFONO = /[0-9]{7,11}/

  validates :phone, presence: true, length: {maximum: 9}, format: { with: EXPRESION_REGULAR_TELEFONO }
  validates :address, :name,  presence: true
  
  
  has_many :book_lends
  has_many :books, through: :book_lends

end
