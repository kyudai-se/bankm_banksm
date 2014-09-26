require 'date'
class BanksmsController < ApplicationController
  before_action :set_banksm, only: [:show, :edit, :update, :destroy]

  # GET /banksms
  # GET /banksms.json
  def index
    @bankm = Bankm.find(params[:bankm_id])
    @banksms = @bankm.banksms.order("bank_cd, banks_cd, banks_ed")
  end

  # GET /banksms/1
  # GET /banksms/1.json
  def show
    @bankm = Bankm.find(params[:bankm_id])
    @banksm = @bankm.banksms.find(params[:id])
  end

  # GET /banksms/new
  def new
    @bankm = Bankm.find(params[:bankm_id])
    @banksm = @bankm.banksms.build
  end

  # GET /banksms/1/edit
  def edit
    @bankm = Bankm.find(params[:bankm_id])
    @banksm = @bankm.banksms.find(params[:id])
  end

  # POST /banksms
  # POST /banksms.json
  def create
    @bankm = Bankm.find(params[:bankm_id])
    @banksm = @bankm.banksms.new(banksm_params)
    @banksm.bank_cd = @bankm.bank_cd
    @banksm.entdate = Time.now
    respond_to do |format|
      if @banksm.save
        format.html { redirect_to bankm_banksm_url(@bankm, @banksm, bank_params), notice: 'Banksm was successfully created.' }
        format.json { render json: @banksm, status: :created, location: @banksm }
      else
        format.html { render action: 'new' }
        format.json { render json: @banksm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banksms/1
  # PATCH/PUT /banksms/1.json
  def update
    @bankm = Bankm.find(params[:bankm_id])
    @banksm = @bankm.banksms.find(params[:id])
    @banksm.edtdate = Time.now
    @banksm.bank_cd_copy = @banksm.bank_cd
    @banksm.banks_cd_copy = @banksm.banks_cd
    @banksm.banks_ed_copy = @banksm.banks_ed
    respond_to do |format|
      if @banksm.update(banksm_params)
        format.html { redirect_to bankm_banksm_url(@bankm, @banksm, bank_params), notice: 'Banksm was successfully updated.' }
        format.json { head :no_content }
      else
        @banksm.bank_cd = @banksm.bank_cd_copy
        @banksm.banks_cd = @banksm.banks_cd_copy
        @banksm.banks_ed = @banksm.banks_ed_copy
        format.html { render action: 'edit' }
        format.json { render json: @banksm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banksms/1
  # DELETE /banksms/1.json
  def destroy
    @bankm = Bankm.find(params[:bankm_id])
    @banksm = @bankm.banksms.find(params[:id])
    @banksm.destroy
    respond_to do |format|
      format.html { redirect_to bankm_banksms_url(bank_params) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banksm
      @banksm = Banksm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banksm_params
      params.require(:banksm).permit(:entdate, :entmcn, :entclt, :edtdate, :edtmcn, :edtclt, :bank_cd, :banks_cd, :banks_ed, :banks_j, :banks_a, :banks_k)
    end
end
