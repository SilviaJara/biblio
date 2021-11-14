class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show

    if user_signed_in? && current_user.admin
      get_book_lends_for_book @book

    end
  end

  # GET /books/new
  def new
    if user_signed_in? == false || current_user.admin == false
      redirect_to books_path
    end

    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    if user_signed_in? == false || current_user.admin == false
      redirect_to books_path
    end
    
  end


  # POST /books or /books.json
  def create

    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /books/1 or /books/1.json
  def update


    if user_signed_in? == false || current_user.admin == false
      redirect_to books_path
    end

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # obtiene los prestamos de libros de un libro específico que no se han devuelto actualmente
    def get_book_lends_for_book book
      @book_lends = BookLend.where(devuelto: false, book_id: book.id)
    end
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :pub_date, :stock, :autor_id, category_ids:[] , book_lends_ids:[])
    end
end
