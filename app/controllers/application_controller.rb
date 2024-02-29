class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :check_role_for_restaurant_routes

  protected

  # Business Logic to make sure that the roles field is properly added
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  # Business Logic for Routes
  # def after_sign_in_path_for(resource)
  #   # Customize the redirect path after sign in
  #   if resource.is_a?(User)
  #     # Redirect to the customer index page
  #     admin_home_path
  #   else
  #     # Default redirect path for other types of resources (if applicable)
  #     root_path
  #   end
  # end

  #Improved Business Logic for Routing based on Role
  def after_sign_in_path_for(resource)
    # Customize the redirect path after sign in
    if resource.is_a?(User)
      if resource.role == 'Owner'
        # Redirect to the owner index page
        owner_home_path
      elsif resource.role == 'Customer'
        # Redirect to the customer index page
        customer_home_path
      elsif resource.role == 'Admin'
        # Redirect to the admin index page
        admin_home_path
      else
        # Default redirect path for unknown roles
        root_path
      end
    else
      # Default redirect path for non-users
      root_path
    end
  end
  #Code to Handle Cascading Drop-Down Boxes of the Reservation Form
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      # Update table availability
      table = Table.find(@reservation.table_id)
      table.update(is_available: false)

      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  #Code to Block off Users with the Customer Role form accessing resturant routes
  private

  def check_role_for_restaurant_routes
    if params[:controller].start_with?('restaurants') && !current_user.owner?
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :table_id, :reservation_date, :reservation_time)
  end

end
