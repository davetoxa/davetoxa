class OmniauthController < Devise::OmniauthCallbacksController
  def github
    user = User.from_omniauth(auth_hash)
    user.persisted? ? sign_in_and_redirect(user) : redirect_to(root_path)
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
