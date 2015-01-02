class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user

  def show
  end

  protected
    def set_user
      @user = User.find_by(username: params[:id]).decorate
    end
end
