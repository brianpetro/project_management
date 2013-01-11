class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        users_path
      when 'silver'
        user_path(current_user.id)
      when 'gold'
        user_path(current_user.id)
      when 'platinum'
        user_path(current_user.id)
      else
        root_path
    end
  end
end
