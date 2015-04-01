class User < ActiveRecord::Base
# a user has one provider
# a user has many vendors 

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.code = ""
    end
  end
end
