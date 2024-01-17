# frozen_string_literal: true

# ApplicationController is the base controller class for the entire application.
# It includes common functionality and filters that are shared across controllers.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name contact_number blood_group company_name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name last_name contact_number blood_group company_name])
  end
end
