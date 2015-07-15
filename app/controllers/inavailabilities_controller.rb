class InavailabilitiesController < ApplicationController
  before_action :set_inavailability, only: [:show, :edit, :update, :destroy]

  # GET /inavailabilities
  # GET /inavailabilities.json
  def index
    @inavailabilities = Inavailability.all
  end

  # GET /inavailabilities/1
  # GET /inavailabilities/1.json
  def show
  end

  # GET /inavailabilities/new
  def new
    @inavailability = Inavailability.new
  end

  # GET /inavailabilities/1/edit
  def edit
  end

  # POST /inavailabilities
  # POST /inavailabilities.json
  def create
    @inavailability = Inavailability.new(inavailability_params)

    respond_to do |format|
      if @inavailability.save
        format.html { redirect_to @inavailability, notice: 'Inavailability was successfully created.' }
        format.json { render :show, status: :created, location: @inavailability }
      else
        format.html { render :new }
        format.json { render json: @inavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inavailabilities/1
  # PATCH/PUT /inavailabilities/1.json
  def update
    respond_to do |format|
      if @inavailability.update(inavailability_params)
        format.html { redirect_to @inavailability, notice: 'Inavailability was successfully updated.' }
        format.json { render :show, status: :ok, location: @inavailability }
      else
        format.html { render :edit }
        format.json { render json: @inavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inavailabilities/1
  # DELETE /inavailabilities/1.json
  def destroy
    @inavailability.destroy
    respond_to do |format|
      format.html { redirect_to inavailabilities_url, notice: 'Inavailability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inavailability
      @inavailability = Inavailability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inavailability_params
      params.require(:food_item).permit(:date, :catering_company_id, :time_slot_id )
    end
end
