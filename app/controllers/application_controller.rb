class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: :home,

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in) do |u|
            u.permit({ roles: [] }, :username, :password, :remember_me)
        end
        devise_parameter_sanitizer.permit(:sign_up) do |u|
            u.permit({ roles: [] }, :firstname, :lastname, :email, :username, :password,
            :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:account_update) do |u|
            u.permit({ roles: [] }, :firstname, :lastname, :email, :username, :password,
            :password_confirmation)
        end
    end
end
