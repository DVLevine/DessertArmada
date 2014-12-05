class UsersController < ApplicationController
  # Actions

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.bmr = 0
    if @user.save
      calculateBMR(@user)
      session[:user_id] = @user.id
      redirect_to root_url, notice: "You've a-signed up kid"
    else
      render "new"
    end
    puts @user.bmr
  end

  def calculateBMR(theUser)
    @user = theUser
    #male
    if @user.gender == 1
      @user.bmr = 10 * @user.weight + 6.25*@user.height - 5*@user.age + 5
    #female
    else
      @user.bmr	= 10 * @user.weight + 6.25*@user.height	- 5*@user.age -	161
    end  
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,:gender, :height, :weight, :age)
  end
  

end
