class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :admin_user?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin_user?
    current_user && current_user.email_address == "admin@example.com" # หรือ logic อื่นๆ
  end
end
