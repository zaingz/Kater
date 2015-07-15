class FoodItemAddOnsController < ApplicationController
  before_action :set_food_item_add_on, only: [:show, :edit, :update, :destroy]
  before_action :authorize_as_shop_admin, only: [:edit, :update,:destroy ]

  # GET /food_item_add_ons
  # GET /food_item_add_ons.json
  def index
    @food_item_add_ons = FoodItemAddOn.all
  end

  # GET /food_item_add_ons/1
  # GET /food_item_add_ons/1.json
  def show
  end

  # GET /food_item_add_ons/new
  def new
    @food_item_add_on = FoodItemAddOn.new
  end

  # GET /food_item_add_ons/1/edit
  def edit
  end

  # POST /food_item_add_ons
  # POST /food_item_add_ons.json
  def create
    @food_item_add_on = FoodItemAddOn.new(food_item_add_on_params)

    respond_to do |format|
      if @food_item_add_on.save
        format.html { redirect_to @food_item_add_on, notice: 'Food item add on was successfully created.' }
        format.json { render :show, status: :created, location: @food_item_add_on }
      else
        format.html { render :new }
        format.json { render json: @food_item_add_on.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_item_add_ons/1
  # PATCH/PUT /food_item_add_ons/1.json
  def update
    respond_to do |format|
      if @food_item_add_on.update(food_item_add_on_params)
        format.html { redirect_to @food_item_add_on, notice: 'Food item add on was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_item_add_on }
      else
        format.html { render :edit }
        format.json { render json: @food_item_add_on.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_item_add_ons/1
  # DELETE /food_item_add_ons/1.json
  def destroy
    @food_item_add_on.destroy
    respond_to do |format|
      format.html { redirect_to food_item_add_ons_url, notice: 'Food item add on was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item_add_on
      @food_item_add_on = FoodItemAddOn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_item_add_on_params
      params.require(:food_item_add_on).permit(:name,  :price, :food_item_id )
    end
end
