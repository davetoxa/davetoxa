def auth(user)
  OmniAuth.config.mock_auth[:github] = {
    "uid"      => user.uid,
    "info"     => {
      "nickname" => user.username,
      "email"    => user.email,
      "name"     => user.name,
    }
  }
  visit user_omniauth_authorize_path(:github)
end