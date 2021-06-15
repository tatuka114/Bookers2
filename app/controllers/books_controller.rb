class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}


    def create
      @user = current_user
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book), notice:"You have created book successfully."
      else
        @user = current_user
        @books = Book.all
        render :index
      end
    end
    def index
      @book = Book.new
      @books = Book.all
      @user = current_user
    end
    def show
      @book = Book.find(params[:id])
      @user = @book.user
      @newbook = Book.new
    end
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to book_path
    end
    private
    def book_params
      params.require(:book).permit(:profile_image, :title, :opinion)
    end
end
