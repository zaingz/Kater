class FoodItemsController < ApplicationController

  before_action :set_food_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_as_shop_admin, only: [:edit, :update,:destroy, :new ]


  def index
    @food_items = FoodItem.all
  end

  # GET /food_items/1
  # GET /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    @food_item = FoodItem.new
  end

  # GET /food_items/1/edit
  def edit
    @all_food_items = current_user.catering_company.food_items
    render "/dashboard/create_food_item"
  end

  # POST /food_items
  # POST /food_items.json
  def create
    @food_item = FoodItem.new(food_item_params)
    
    @food_item.catering_company = current_user.catering_company

    #@food_item.food_item_add_ons << FoodItemAddOn.create(params[:food_item][:food_item_add_on])

    respond_to do |format|
      if @food_item.save
        
        
        @food_item.food_item_add_ons << FoodItemAddOn.create(food_item_add_ons)
        format.html { redirect_to :controller => 'dashboard', :action => 'create_food_item' }
        format.json { render :show, status: :created, location: @food_item }
        flash[:notice] = "Food Item Created successfully"
      else
        format.html { render :new }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1
  # PATCH/PUT /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        food_item_add_ons.each do |f|  
          if f[:id]   
            add_on = FoodItemAddOn.find(f[:id])
            add_on.update(name: f[:name], price: f[:price])
          else
            @food_item.food_item_add_ons << FoodItemAddOn.create(f)
          end
        end
        flash[:notice] = "successfully edited #{@food_item.name}"
        format.html { redirect_to :controller => 'dashboard', :action => 'create_food_item' }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1
  # DELETE /food_items/1.json
  def destroy
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_to food_items_url, notice: 'Food item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_item_params
      params.require(:food_item).permit(:name, :description,:pico,  :price )
    end

    def food_item_add_ons
      params.permit(add_ons: [:id, :name, :price])[:add_ons]
    end

