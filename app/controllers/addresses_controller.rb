class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
#hello there

  def index
    @addresses = Address.all
  end


  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    respond_to do |format|
      if @address.save
        format.html { redirect_to :controller => 'dashboard', :action => 'user_account_page' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render "dashboard/user_account_page" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to :controller => 'dashboard', :action => 'user_account_page' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render "dashboard/user_account_page" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to :controller => 'dashboard', :action => 'user_account_page' }
      format.json { head :no_content }
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit( :city, :country , 
      :mobile_numer1,:mobile_numer2,:email,  :full_name, :street_address, :street_address_opt, :user_id )
  end
end
