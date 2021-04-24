class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def create
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
  if  @user.update(user_params)
       flash[:notice] = 
       redirect_to user_path(@user.id)
  else
    render :edit
  end
  end

  def new
  end


  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

    private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end

end
