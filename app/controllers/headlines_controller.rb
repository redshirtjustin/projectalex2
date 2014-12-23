class HeadlinesController < ApplicationController
  before_action :set_headline, only: [:show, :edit, :update, :destroy]

  # GET /headlines
  # GET /headlines.json
  def index
    @headlines = Headline.all
  end

  # GET /headlines/1
  # GET /headlines/1.json
  def show
  end

  # GET /headlines/new
  def new
    @headline = Headline.new
  end

  # GET /headlines/1/edit
  def edit
  end

  # POST /headlines
  # POST /headlines.json
  def create
    @headline = Headline.new(headline: headline_params[:headline], story_id: params[:story_id])

    respond_to do |format|
      if @headline.save
        format.html { redirect_to story_path(params[:story_id]), notice: 'Headline was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /headlines/1
  # PATCH/PUT /headlines/1.json
  def update
    respond_to do |format|
      if @headline.update(headline_params)
        format.html { redirect_to @headline, notice: 'Headline was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /headlines/1
  # DELETE /headlines/1.json
  def destroy
    @headline.destroy
    respond_to do |format|
      format.html { redirect_to story_path(params[:story_id]), notice: 'Headline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET stories/:story_id/headlines/:id
  def active_headline
    respond_to do |format|
      format.html { redirect_to story_path(params[:story_id]), notice: 'Active Headline action was tripped. And redirected to story #{params[:story_id]}' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headline
      @headline = Headline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def headline_params
      params[:headline]
    end

end
