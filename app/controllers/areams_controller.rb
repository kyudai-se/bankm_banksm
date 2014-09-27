class AreamsController < ApplicationController
  before_action :set_aream, only: [:show, :edit, :update, :destroy]

  # GET /areams
  # GET /areams.json
  def index
    @areams = Aream.order("area_cd")
  end

  # GET /areams/1
  # GET /areams/1.json
  def show
  end

  # GET /areams/new
  def new
    @aream = Aream.new
  end

  # GET /areams/1/edit
  def edit
  end

  # POST /areams
  # POST /areams.json
  def create
    @aream = Aream.new(aream_params)
    @aream.entdate = Time.now
    respond_to do |format|
      if @aream.save
        format.html { redirect_to @aream, notice: 'Aream was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aream }
      else
        format.html { render action: 'new' }
        format.json { render json: @aream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areams/1
  # PATCH/PUT /areams/1.json
  def update
    @aream.edtdate = Time.now
    respond_to do |format|
      if @aream.update(aream_params)
        format.html { redirect_to @aream, notice: 'Aream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areams/1
  # DELETE /areams/1.json
  def destroy
    @aream.destroy
    respond_to do |format|
      format.html { redirect_to areams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aream
      @aream = Aream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aream_params
      params.require(:aream).permit(:entdate, :entmcn, :entclt, :edtdate, :edtmcn, :edtclt, :area_cd, :area_j, :area_a, :area_k)
    end
end
