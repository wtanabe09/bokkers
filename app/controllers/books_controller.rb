class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.valid? && book.save
      redirect_to book_path(book.id), notice: 'Book was successfully created.'
    else
      @books = Book.all
      @book = book
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.valid? && book.update(book_params)
      redirect_to book_path(book.id), notice: 'Book was successfully update.'
    else
      @book = book
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Book was successfully destroy'
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
