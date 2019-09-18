# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  # around_action :switch_locale
  #
  # def switch_locale(&action)
  #   locale = params[:locale] || I18n.default_locale
  #   I18n.with_locale(locale, &action)
  # end

  rescue_from CanCan::AccessDenied, with: :access_denied

  def access_denied(exception)
    store_location_for :user, request.path
    redirect_to user_signed_in? ? root_path : new_user_session_path, alert: exception.message
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
