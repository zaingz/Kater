class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :authorize_as_shop_admin, only: [:edit, :update,:destroy, :new ]
  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # GET /deals/1/edit
  def edit
    
    @deals = current_user.catering_company.deals
    render "/dashboard/manage_deals"
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.catering_company= current_user.catering_company
   @deal.food_items = FoodItem.where(id: deal_params[:food_item_ids].compact())

    respond_to do |format|
      if @deal.save
        format.html { redirect_to :controller => 'dashboard', :action => 'manage_deals' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      @deal.food_items = FoodItem.where(id: deal_params[:food_item_ids].compact())
      if @deal.update(deal_params)
        format.html {  redirect_to :controller => 'dashboard', :action => 'manage_deals' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:name, :description,  :price,:pico, {:food_item_ids=>[]}, :pico_cache )
    end
end
