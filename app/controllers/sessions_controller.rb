class SessionsController < ApplicationController

  def new
  end

  def create
    # pay attention to downcase sufix at next line, this can cause invalid user on sign in.
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_url
    else
      flash.now[:error] = 'Usuário ou senha inválidos.'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end