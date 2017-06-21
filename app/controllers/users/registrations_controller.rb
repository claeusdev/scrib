class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :about])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :about])
    end
end