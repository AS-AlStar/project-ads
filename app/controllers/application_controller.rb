# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :access_denied

  def access_denied(exception)
    store_location_for :user, request.path
    redirect_to user_signed_in? ? root_path : new_user_session_path, alert: exception.message
  end
end
