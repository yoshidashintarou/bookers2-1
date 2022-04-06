class UsersController < ApplicationController
   
  def show
   @user = User.find(params[:id])
   @books = @user.books
   @new_book = Book.new
  end
  
  def edit
   @user = User.find(params[:id])
  
   if @user == current_user
      render :edit
   else
      redirect_to user_path(current_user)
   end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully.."
      redirect_to user_path(@user)
    else
       render :edit
    end
  end

 def new
    @user = User.new
 end
 
 
 

 def index
   @user = current_user
   @book = Book.new
   @books = Book.all
   @users = User.all
 end
 
 def create
  @user = User.new(user_params)
  @user.user_id = current_user.id
  if @user.save
    redirect_to edit_user_path
  else
    render user_path
  end
 end
 
 def destroy
    @user = current_user
    if @user.destroy
       flash[:notice]="successfully"
    redirect_to root_path
    end
 end
 
 private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end

def book_params
    params.require(:book).permit(:title, :body)
end