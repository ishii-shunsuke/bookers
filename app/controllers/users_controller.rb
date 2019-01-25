class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    book.save
    redirect_to book_path(@book_params)
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private
    def user_params
        params.require(:user).permit(:username,:profile_image,:introduction)
    end
end
