class ApplicationController < ActionController::Base
	before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :contact_number, :blood_group, :company_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :contact_number, :blood_group, :company_name])
  end
end
