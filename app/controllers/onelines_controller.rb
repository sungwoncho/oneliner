class OnelinesController < ApplicationController
  before_action :set_oneline, only: [:show, :edit, :update, :destroy]

  # GET /onelines.json
  def index
    @onelines = Oneline.all
  end

  # GET /onelines/1.json
  def show
  end

  # POST /onelines.json
  def create
    @oneline = Oneline.new(oneline_params)

    respond_to do |format|
      if @oneline.save
        format.html { redirect_to @oneline, notice: 'Oneline was successfully created.' }
        format.json { render :show, status: :created, location: @oneline }
      else
        format.html { render :new }
        format.json { render json: @oneline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onelines/1.json
  def destroy
    @oneline.destroy
    respond_to do |format|
      format.html { redirect_to onelines_url, notice: 'Oneline was successfully destroyed.' }
      format.json { head :no_content }
    end
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
