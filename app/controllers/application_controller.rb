class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # Ensure the user is logged in
  # Whitelist actions that do not need authentication
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found(error)
      render json: { error: error.message }, status: 404
    end

end
