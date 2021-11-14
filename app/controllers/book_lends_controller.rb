class BookLendsController < ApplicationController
  before_action :authenticate_user!
  def index

    @book_lends = BookLend.where(user_id: current_user.id, devuelto: false)

  end

  def new
    
    @book = Book.find_by(id: params[:book_id])

    if @book.stock <= 0
      redirect_to root_path
    end

    @book_lend = BookLend.new
    
  end

  def return_book 

    respond_to do |format|
      @book_lend = BookLend.find_by(id: params[:lend_id])
      if current_user.admin == false ||@book_lend.devuelto == nil || @book_lend.devuelto == true
        format.html { redirect_to root_path }
      else
        @book_lend.devuelto = true
        @book_lend.save
        @book = Book.find_by(id: @book_lend.book_id) 
        @book.stock = @book.stock + 1
        
        @book.save
        format.html { redirect_to book_path }
      end
  end
end


  def create
    @book_lend = BookLend.new(book_params)

    respond_to do |format|
      if @book_lend.save
        @book = Book.find_by id: @book_lend.book_id
        @book.stock = @book.stock - 1
        @book.save
        format.html { redirect_to book_lends_path }
      else
        format.html { redirect_to book_lends_path }
      end
    end
  end


  private
  def book_params
    params.require(:book_lend).permit(:start_date, :end_date, :devuelto, :user_id, :book_id)
  end

 
end
