def auth(user)
  OmniAuth.config.mock_auth[:github] =  OmniAuth::AuthHash.new({
    uid: user.uid.to_s,
    info: {
      nickname: user.username,
      email: user.email,
      name: user.name
    }
  })
  visit user_omniauth_authorize_path(:github)
end
