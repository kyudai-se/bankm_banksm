require 'date'
class BankmsController < ApplicationController
  before_action :set_bankm, only: [:show, :edit, :update, :destroy]
  autocomplete  :bankm, :bank_j,  :full => true, :limit => 1000
  autocomplete  :bankm, :bank_cd, :full => true, :limit => 1000
              { :order => :bank_cd }
  def auto_complete_for_bankm_bank_j
    find_options = { 
      :conditions => [ "bank_j LIKE ?",
                       '%' + params[:bankm][:bank_j].downcase + '%' ], 
      :limit => 1000
    }
    @bankms = Bankm.find(:all, find_options)
    render :partial => 'auto_complete_for_bank_J'
  end

  def auto_complete_for_bankm_bank_cd
    find_options = {
      :conditions => [ "bank_cd LIKE ?",
                       '%' + params[:bankm][:bank_cd].downcase + '%' ],
      :limit => 1000
    }
    @bankms = Bankm.find(:all, find_options)
    render :partial => 'auto_complete_for_bank_CD'
  end

  def bank_params
    {:bank_j_search  => params[:bank_j_search],
     :bank_cd_search => params[:bank_cd_search]}
  end
  helper_method :bank_params

  # GET /bankms
  # GET /bankms.json
  def index
    if !params[:bank_j_search].blank? && !params[:bank_cd_search].blank?
      @bankms = Bankm.where(["bank_j LIKE ? AND bank_cd LIKE ?", "%#{params[:bank_j_search]}%", "%#{params[:bank_cd_search]}%"])
    elsif !params[:bank_j_search].blank?
      @bankms = Bankm.search(params[:bank_j_search]).sort_by{|bankm| (bankm.bank_cd.to_i)}
    elsif !params[:bank_cd_search].blank?
      @bankms = Bankm.search(params[:bank_cd_search]).sort_by{|bankm| (bankm.bank_cd.to_i)}
    else
      render action: 'search'
    end
  end

  # GET /bankms/1
  # GET /bankms/1.json
  def show
  end

  # GET /bankms/new
  def new
    @bankm = Bankm.new
  end

  # GET /bankms/1/edit
  def edit
  end

  # POST /bankms
  # POST /bankms.json
  def create
    @bankm = Bankm.new(bankm_params)
    @bankm.entdate = Time.now
    respond_to do |format|
      if @bankm.save
        format.html { redirect_to @bankm, notice: '新規登録が行われました' }
        format.json { render action: 'show', status: :created, location: @bankm }
      else
        format.html { render action: 'new' }
        format.json { render json: @bankm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bankms/1
  # PATCH/PUT /bankms/1.json
  def update
    @bankm.edtdate = Time.now
    respond_to do |format|
      if @bankm.update(bankm_params)
        format.html { redirect_to @bankm, notice: '銀行の編集が行われました' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bankm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bankms/1
  # DELETE /bankms/1.json
  def destroy
    @bankm.destroy
    respond_to do |format|
      format.html { redirect_to bankms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bankm
      @bankm = Bankm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bankm_params
      params.require(:bankm).permit(:entdate, :entmcn, :entclt,
                                    :edtdate, :edtmcn, :edtclt,
                                    :bank_cd, :bank_j, :bank_a, :bank_k)
    end
end

