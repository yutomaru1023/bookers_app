class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.new
    @b =Book.all
  end
  
  def create
    book = Book.new(list_params)
   if book.save
     flash[:notice] = 'successfully create'
    redirect_to name_path(book.id)
    
   end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(list_params)
    if book.save
     flash[:notice] = 'successfully update'
    redirect_to name_path(book.id)  
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
 private
  # ストロングパラメータ
  def list_params
    params.require(:book).permit(:title, :body)
  end
end

