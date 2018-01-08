class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#   before_action :require_login
# private
# def require_login
#   user=User.find_by_name(params[:name])
#  unless user?
#   flash[:error]='必须登录'
#   redirect_to login_url
#  end
# end

  def current_user
    @_current_user ||=cookies[:current_user_id] &&
    User.find_by(id: cookies[:current_user_id])
  end
  helper_method :current_user
end
