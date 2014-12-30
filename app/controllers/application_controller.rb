class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Ensure the user is logged in
  # Whitelist actions that do not need authentication
  before_action :authenticate_user!

  def index
  end
end
