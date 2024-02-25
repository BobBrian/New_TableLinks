class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Business Logic to make sure that the roles field is properly added
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  # Business Logic for Routes
  def after_sign_in_path_for(resource)
    # Customize the redirect path after sign in
    if resource.is_a?(User)
      # Redirect to the customer index page
      admin_home_path
    else
      # Default redirect path for other types of resources (if applicable)
      root_path
    end
  end

end
