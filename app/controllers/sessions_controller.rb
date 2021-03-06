class SessionsController < ApplicationController

  def new 
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      redirect_to root_path
    else
      render :new
    end  
  end

  def destroy
    sign_out
    flash[:notice] = "You've been logged out."
    redirect_to root_path
  end

end
