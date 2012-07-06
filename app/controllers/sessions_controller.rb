class SessionsController < ApplicationController
  
  def new
  end

  def create
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user] = user
        redirect_to zap_cards_path, :notice => "logged in !"
      else
        flash.now.alert = "Invalid username or password"
        render "new"
      end
    end

    def destroy
      session[:user] = nil
      redirect_to root_url, :notice => "Logged out!"
    end
end