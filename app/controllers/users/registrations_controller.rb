class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]

  # before_action :configure_account_update_params, only: [:update]

  def index
    redirect_to root_path if user_signed_in?
  end

  def sns
    @user.uid = session[:uid]
    @user.provider = session[:provider]
    @user.email = session[:email]
    @user.password = session[:password]
    @user.password_confirmation = session[:password_confirmation]
  end

  def create
    super
    @user.uid = session[:uid]
    @user.provider = session[:provider]
    @user.email = session[:email]
    @user.password = session[:password]
    @user.password_confirmation = session[:password_confirmation]
    @user.save
  end

  private

  def customize_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :id, 
        :email, 
        :password,
        :password_confirmation, 
        :nickname, 
        :phone_number,
        :kanji_surname, 
        :kanji_name,
        :kana_surname, 
        :kana_name, 
        address_attributes: [
          :postal_code, 
          :prefecture_id, 
          :city, 
          :street_number, 
          :building, 
          :home_number
        ]
      )
    end
  end

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate 
    return false unless verify_recaptcha(model: resource)
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
