class VotesController < ApplicationController
  before_action :get_oneline
  before_action :set_vote_type

  def create
    if @vote_type.eql? 'up'
      current_user.upvote(@oneline)
    elsif @vote_type.eql? 'down'
      current_user.downvote(@oneline)
    end

    render 'show', status: 201
  end

  protected
    def get_oneline
      @oneline = Oneline.find(params[:id])
    end

    def set_vote_type
      @vote_type = params[:vote_type]
    end
end
