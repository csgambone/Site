class CatchRatesController < ApplicationController
  before_action :set_catch_rate, only: [:show, :edit, :update, :destroy]

  # GET /catch_rates
  # GET /catch_rates.json
  def index
    @catch_rates = CatchRate.all
  end

  # GET /catch_rates/1
  # GET /catch_rates/1.json
  def show
  end

  # GET /catch_rates/new
  def new
    @catch_rate = CatchRate.new
  end

  # GET /catch_rates/1/edit
  def edit
  end

  # POST /catch_rates
  # POST /catch_rates.json
  def create
    @catch_rate = CatchRate.new(catch_rate_params)

    respond_to do |format|
      if @catch_rate.save
        format.html { redirect_to @catch_rate, notice: 'Catch rate was successfully created.' }
        format.json { render :show, status: :created, location: @catch_rate }
      else
        format.html { render :new }
        format.json { render json: @catch_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catch_rates/1
  # PATCH/PUT /catch_rates/1.json
  def update
    respond_to do |format|
      if @catch_rate.update(catch_rate_params)
        format.html { redirect_to @catch_rate, notice: 'Catch rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @catch_rate }
      else
        format.html { render :edit }
        format.json { render json: @catch_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catch_rates/1
  # DELETE /catch_rates/1.json
  def destroy
    @catch_rate.destroy
    respond_to do |format|
      format.html { redirect_to catch_rates_url, notice: 'Catch rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catch_rate
      @catch_rate = CatchRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catch_rate_params
      #params[:catch_rate]
      params.require(:catch_rate).permit(:id, :catchrate, :currenthp, :maxhp, :status, :ball, :opower, :caught, :repeat, :turn_number, :enemy_level, :bug_water_type, :dive_surf_fish, :cave_night)
    end
end
