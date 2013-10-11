def auth(user = FactoryGirl.create(:user))
  visit root_path

  OmniAuth.config.mock_auth[:github] = {
    "provider" => "github",
    "uid"      => user.account_github.github_id,
    "info"     => {
      "nickname" => user.username,
      "email"    => user.profile.email,
      "name"     => user.name,
    },
    "credentials" => {
      "token" => user.account_github.token
    },
  }

  click_link 'Login'
end