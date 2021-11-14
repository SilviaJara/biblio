# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.create([{name: "Misterio"},
    {name: "Accion y aventura"},
    {name: "Horror"},
    {name: "Romance"},
    {name: "Ciencia Ficción"},
    ])


User.create! :name => 'Admin', :email => 'admin@gmail.com',:phone => '123456789', :address => 'adsfaer', :admin => true, :password => '123456', :password_confirmation => '123456'
User.create! :name => 'Silvia', :email => 'silvia@gmail.com',:phone => '123456789', :address => 'qwer', :admin => false, :password => '123456', :password_confirmation => '123456'
    
Autor.create([
    {name: "Stephen King"},
    {name: "Arthur Conan Doyle"}
]
)

Book.create name: 'The Stand', pub_date: Date.new(1978, 10, 3), stock: 5, category_ids: [Category.find_by(name: "Horror").id], autor_id: Autor.find_by(name: "Stephen King").id
Book.create name: 'Sherlock Holmes', pub_date: Date.new(1917, 10, 22), stock: 3,category_ids: [Category.find_by(name: "Misterio").id], autor_id: Autor.find_by(name: "Arthur Conan Doyle").id
