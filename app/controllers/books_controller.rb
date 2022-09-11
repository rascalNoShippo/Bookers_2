class BooksController < ApplicationController

  def index
  end
  
  def create
    @new_book = Book.new(book_params)
    @new_book.user = current_user
    if @new_book.save
      redirect_to book_path(@new_book.id)
    else
      @rendered = true
      render :index
    end
  end

  def show
    @selected_book = Book.find(params[:id])
    @user = @selected_book.user #サイドバーでの表示ユーザー
  end
  
  def edit
    @sidebar = "hidden"
    @editing_book = Book.find(params[:id])
  end
  
  def update
    @sidebar = "hidden"
    @editing_book = Book.find(params[:id])
    if @editing_book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    Book.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
