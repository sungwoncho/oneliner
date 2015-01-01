class OnelinesController < ApplicationController
  before_action :set_oneline, only: [:show, :destroy]
  skip_before_action :authenticate_user!, except: [:create, :destroy]

  # GET /onelines.json
  def index
    @onelines = Oneline.search(params[:keyword])
  end

  # GET /onelines/1.json
  def show
  end

  # POST /onelines.json
  def create
    @oneline = current_user.authored_onelines.new(oneline_params)

    if @oneline.save
      render 'show', status: 201
    else
      render json: @oneline.errors, status: 422
    end

  end

  # DELETE /onelines/1.json
  def destroy
    head 204 if @oneline.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oneline
      @oneline = Oneline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oneline_params
      params.require(:oneline).permit(:subject, :definition)
    end
end
