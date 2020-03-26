class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      respond_to do |format|
        format.html { redirect_to current_user, notice: "User was logged correctly." }
        log_in @user
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    #log_out
    #redirect_to root_url
  end 
end
