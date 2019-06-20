class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 仮置き
  def after_sign_up_path_for(resource)
    root_path
  end

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
        address_attributes: [:postal_code, :prefecture, :city, :street_number, :building, :home_number]
        )
    end
  end
end
