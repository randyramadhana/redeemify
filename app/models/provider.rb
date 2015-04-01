class Provider < ActiveRecord::Base
	has_many :code
  	attr_accessible :email, :name, :uid, :provider

  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]
  #     user.code = ""
  #   end

  # end


end
