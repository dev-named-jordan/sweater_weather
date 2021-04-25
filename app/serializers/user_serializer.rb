class UserSerializer
  include FastJsonapi::ObjectSerializer

  attribute :email do |user|
    user.email
  end

  attribute :api_key do |user|
    user.api_key
  end 
end
