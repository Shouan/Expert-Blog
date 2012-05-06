class SessionsController < ApplicationController
  def new
  end

  def create
    expert = Expert.find_by_email_address(params[:session][:email])
    if expert && expert.authenticate(params[:session][:password])
      sign_in expert
      redirect_to expert
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
	redirect_to root_path
  end
end
