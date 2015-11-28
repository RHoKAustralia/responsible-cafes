class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?

  before_filter :store_location

  # Store users previous location before signing in
  def store_location
    ignored_routes = [
      "devise/confirmations",
      "devise/sessions",
      "devise/registrations"
    ]

    # If devise model is not User, then replace :user_return_to with :{devise model}_return_to
    unless ignored_routes.include? params[:controller]
      session[:user_return_to] = request.url
    end
  end

  def after_sign_in_path_for(resource)
    dashboard_path(user_id: resource.id)
  end

  rescue_from CanCan::AccessDenied do |exception|
    unless user_signed_in?
      redirect_to new_user_session_path, :alert => "You should sign in to see if you can view this page! =)"
    else
      redirect_to dashboard_path(user_id: current_user.id), :alert => "Oh rats! That page doesn't exist or your don't have permissions to view it. You should sign in"
    end
  end

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end
