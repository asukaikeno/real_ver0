class UsersController < ApplicationController
  
  #新規登録
  def new
    @user = User.new
  end

  #マイページを表示させる
  def show
  	@user = User.find(params[:id])
  end


  def create
   @user = User.new(user_params) 
    if @user.save
      log_in @user
   	 flash[:success] = "Welcome to REAL!"
     redirect_to @user
   else
      render 'new'
   end
  end

   private

     def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
     end

end
