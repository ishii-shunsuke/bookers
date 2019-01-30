class BooksController < ApplicationController


  before_action :authenticate_user!

  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

    def ensure_correct_user
      @book = Book.find(params[:id])
      if @book.user.id != current_user.id
        redirect_to books_path
      end
    end


  def show
   @book = Book.new
   @book_show = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:update] = "successfully created.."
    redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if@book.update(book_params)
    flash[:update] = "successfully updated."
    redirect_to book_path(@book.id)
   else
    render :edit
  end
  end

  def destroy
     @book = Book.find(params[:id])
     if@book.destroy
     flash[:destroy] = "successfully destroyed."
     redirect_to books_path
   end
  end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
