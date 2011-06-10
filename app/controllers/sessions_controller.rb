class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    user= User.authenticate(params[:session][:email],params[:session][:password])
    if user.nil?
      flash.now[:error]= "Sorry! You entered an invalid email/password combination."
      @title="Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
    flash[:success]="You have been signed out and your cookie has been deleted.  Please come back soon!"
    
  end
end