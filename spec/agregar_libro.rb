require 'rails_helper'

RSpec.feature 'Agregar Libro' do

    before(:all) do
        create(:admin)
        create(:user)
        create(:category)
        create(:autor)
        create(:book)
       
    end

    after(:all) do
        Book.delete_all
        Autor.delete_all
        Category.delete_all
        User.delete_all
       
    end

    scenario 'Agregar Libro como admin' do
    visit new_book_path

    #iniciar sesión
    click_on ('Iniciar Sesión')
    fill_in "Email",	with: "admin@gmail.com" 
    fill_in "Password",	with: "123456" 
    
    click_on ('Log in')
    expect(page).to have_content("Sesión iniciada como")
    #Crear un libro
    click_on ('Libros')
    click_on ('Agregar libro')
    fill_in "Name",	with: "libro_creado1"
    fill_in "Stock",	with: 3 
   # fill_in "Autor",	with: :autor1

    select "autor1", from: "Autor"
    
    #click_on 'Romance'
    click_on 'Crear autor'
    expect(page).to have_content("Book was successfully created.")
    end


    scenario 'Agregar Libro sin ser Admin' do
        visit new_book_path
    
        #iniciar sesión
        click_on ('Iniciar Sesión')
        fill_in "Email",	with: "silvia@gmail.com" 
        fill_in "Password",	with: "123456" 
        
        click_on ('Log in')
        
        #Crear un libro
        click_on ('Libros')
        expect(page).to have_content("Sesión iniciada como")
        expect(page).not_to have_content 'Agregar libro'
    end

end