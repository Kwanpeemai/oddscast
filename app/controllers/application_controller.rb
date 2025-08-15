class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  def current_user
    @current_user ||= begin
      session = Session.find_by(id: cookies.signed[:session_id])
      session&.user
    end
  end
end
