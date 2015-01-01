class VotesController < ApplicationController
  before_action :get_oneline

  def create
    render nothing: true
  end

  def destroy
  end

  protected
    def get_oneline
      @oneline = Oneline.find(params[:id])
    end
end
