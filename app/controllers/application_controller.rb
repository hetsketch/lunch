class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :store_action

  def render_403
    render file: "public/403.html", status: 403
  end

  def render_404
    render file: "public/404.html", status: 404
  end


  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:users, request.fullpath)
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to menus_path, alert: 'Admins only!'
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
