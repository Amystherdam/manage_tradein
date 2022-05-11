class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sanitized_params, if: :devise_controller?

  def configure_sanitized_params
    devise_parameter_sanitizer.permit(:account_update) do | su |
      su.permit(:email, :password, :password_confirmation, :current_password, user_profile_attributes: [:id, :name, :phone, :gender, :picture])
    end
  end
end
