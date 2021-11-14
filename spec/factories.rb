FactoryBot.define do
  
  factory :admin, class: User do

    email  {"admin@gmail.com"}
    name  {"admin"}
    password  {'123456'}
    admin  {true}  
    phone  {'123456789'}
    address  {"una casita"}

  end

  factory :user, class: User do

    email  {"silvia@gmail.com"}
    name  {"silvia"}
    password  {'123456'}
    admin  {false}  
    phone  {'123455789'}
    address  {"una casita"}

  end

  factory :autor, class: Autor do

    name { "autor1"}

  end
  factory :category, class: Category do

    name {"category"}

  end

  factory :book, class: Book do

    name {"MyString1"}
    pub_date  {Date.current}
    autor {Autor.first}
  end
end