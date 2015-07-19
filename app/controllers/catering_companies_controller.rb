class CateringCompaniesController < ApplicationController
  before_action :set_catering_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :authorize_as_shop_admin, only: [:edit, :update,:destroy, :new ]

  def index
    @catering_company = current_user.catering_company
  end



  # GET /catering_companies/new
  def new
    if (!current_user.catering_company)
         @catering_company = CateringCompany.new
    else
      flash[:notice]= 'You can have only one company'
      redirect_to :controller => 'home', action: 'dashboard'
    end


  end

  # GET /catering_companies/1/edit
  def edit
  end

  # POST /catering_companies
  # POST /catering_companies.json
  def create
    @catering_company = CateringCompany.new(catering_company_params)
    @catering_company.user_id = current_user.id
    respond_to do |format|
      if @catering_company.save
        format.html { redirect_to :controller => 'dashboard', :action => 'manager_admin
        ' }
        format.json { render :show, status: :created, location: @catering_company }
      else
        format.html { render :new }
        format.json { render json: @catering_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catering_companies/1
  # PATCH/PUT /catering_companies/1.json
  def update
    respond_to do |format|
      if @catering_company.update(catering_company_params)
        format.html { redirect_to @catering_company, notice: 'Catering company was successfully updated.' }
        format.json { render :show, status: :ok, location: @catering_company }
      else
        format.html { render :edit }
        format.json { render json: @catering_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catering_companies/1
  # DELETE /catering_companies/1.json
  def destroy
    @catering_company.destroy
    respond_to do |format|
      format.html { redirect_to catering_companies_url, notice: 'Catering company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catering_company
      @catering_company = CateringCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catering_company_params
      params.require(:catering_company).permit(:name, :description,  :number_of_employes,:female_servers,
                                               :arabic_speaking,  :contact_number,
                                               :address, :city, :state, :country)
    end
end
