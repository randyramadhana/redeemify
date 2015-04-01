class ProvidersController < ApplicationController
  

  def index
    # @vendor = Vendor.find(session[:vendor_id])
  end
# --------------------------




  # def create  ## Need to implement whether it's vendor or user
  #   # user = User.from_omniauth(env["omniauth.auth"])
  #   auth = request.env["omniauth.auth"]
    
  #   vendor = Vendor.find_by_provider_and_uid(auth["provider"], auth["uid"])

  #   if vendor != nil
  #     session[:vendor_id]= vendor.id
  #     redirect_to '/vendors/home', notice: "home page, vendor"
  #   else
  #     user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  #     if user.code.nil? || user.code == ""
  #       session[:user_id] = user.id
  #       # redirect_to root_url, notice: "Signed in!"
  #       redirect_to '/sessions/new', notice: "Signed in!"
  #     else
  #       session[:user_id]= user.id
  #       redirect_to '/sessions/customer', notice: "Offer page"
  #     end
  #   end
  # end
# ---------------
  def home
    @provider = Provider.find(session[:provider_id])
  end

  def destroy
    session[:provider_id] = nil
    redirect_to root_url, notice: "Signed out! provider"
  end




end
