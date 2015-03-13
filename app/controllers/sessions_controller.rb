class SessionsController < ApplicationController
  
  def new
    # @user = User.new
    if current_user == nil
      @user = User.new
    else
      if current_user.code == ""
        @user = User.new
      else
        redirect_to '/sessions/offer', notice: "Already register call from sessions#new"
      end
    end
  end

  def enter
    @user = User.new

  end

  def create  ## Need to implement whether it's vendor or user
    # user = User.from_omniauth(env["omniauth.auth"])
    auth = request.env["omniauth.auth"]
    
    vendor = Vendor.find_by_provider_and_uid(auth["provider"], auth["uid"])

    if vendor != nil
      session[:vendor_id]= vendor.id
      redirect_to '/vendors/home', notice: "home page, vendor"
    else
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
       
      if user.provider == "github"
        redirect_to '/sessions/enter', notice: "Signed in!"
      elsif user.code.nil? || user.code == ""
        session[:user_id] = user.id
        # redirect_to root_url, notice: "Signed in!"
        redirect_to '/sessions/new', notice: "Signed in!"
      else
        session[:user_id]= user.id
        redirect_to '/sessions/offer', notice: "Offer page"
      end
    end
  end


  def offer
    # current_user = User.find(session[:user_id])
    if session[:user_id] != nil
      current_user = User.find(session[:user_id])
      if current_user.code? || current_user.code == ""
        @current_code = params[:code]
        current_user.code = @current_code
        current_user.save!
      else
        @current_code = current_user.code
      end
    end

  end

  # def show
  #   @user = User.find(session[:user_id])
  # end




  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end


end
