class BooksController < ApplicationController

  def index
    #Book.new 定義済み
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user = current_user
    if @new_book.save
      flash[:notice] = "Created new book successfully."
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
    if @editing_book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @sidebar = "hidden"
    @editing_book = Book.find(params[:id])
    if @editing_book.update(book_params)
      flash[:notice] = "Updated the book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
