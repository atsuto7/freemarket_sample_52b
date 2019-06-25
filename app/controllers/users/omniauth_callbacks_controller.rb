class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook_callback
    callback_for(:facebook)
  end

  def google_oauth2_callback
    callback_for(:google)
  end

  def callback_for(provider)
    provider = provider.to_s
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:password] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
