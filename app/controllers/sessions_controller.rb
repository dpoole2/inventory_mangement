  class SessionsController < ApplicationController

    def new
      if params[:email].present?
        user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to session[:url_path].present? ? session.delete(:url_path) : home_path, :notice => "Thank you for logging in!"
      else
        flash[:alert] = "Invalid email or password"
        render "new"
      end
      end

    end
  
    def create
      debugger
      
    end
  
    def destroy 
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out!"
    end
    
  end