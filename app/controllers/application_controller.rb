class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def  configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :email, :password, :password_confirmation, :nickname, :phone_number, 
        :kanji_surname, :kanji_name, :kana_surname, :kana_name, 
        address_attributes: [:postal_code, :prefecture_id, :city, :street_number, :building, :home_number]
        )
    end
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["username"] && password == ENV["password"] 
    end
  end
end
      