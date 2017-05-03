class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :registration_params, if: :devise_controller?


  protected

  def registration_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:user_category])
  end
end
