class ApplicationController < ActionController::Base
  include CurrentCar
  before_action :set_cart, except: :sign_in

  before_action :list_parent_level_1_menu
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  skip_before_action :verify_authenticity_token, :only => [:login, :logout]

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def list_parent_level_1_menu
    @categories = Category.list_parent_level_1
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(User::PARAMS_SIGN_UP)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(User::PARAMS_USER_UPDATE)
    end
  end
end
