class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.new
    @b =Book.all
  end

  
  def create
    @books= Book.new(book_params)
    if @books.save
      flash[:notice] = 'successfully create'
      redirect_to name_path(@books.id)
    else
       @b =Book.all
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
     flash[:notice] = 'successfully update'
    redirect_to name_path(@book.id)

    else
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

