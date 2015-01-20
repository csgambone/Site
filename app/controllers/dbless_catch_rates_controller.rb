class DblessCatchRatesController < ApplicationController
  #before_action :set_dbless_catch_rate, only: [:show, :edit, :update, :destroy]

  # GET /dbless_catch_rates/new
  def new
    @dbless_catch_rate = DblessCatchRate.new
  end

  # POST /dbless_catch_rates
  # POST /dbless_catch_rates.json
  def create
    @dbless_catch_rate = DblessCatchRate.new(params[:dbless_catch_rate])

    respond_to do |format|
      if @dbless_catch_rate.valid?
        format.html { redirect_to @dbless_catch_rate, notice: 'Catch rate was successfully created.' }
        format.json { render :show, status: :created, location: @dbless_catch_rate }
      else
        format.html { render :new }
        format.json { render json: @dbless_catch_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dbless_catch_rate
      #@dbless_catch_rate = DblessCatchRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def dbless_catch_rate_params
    #  #params[:dbless_catch_rate]
    #  params.require(:dbless_catch_rate).permit(:id, :catchrate, :currenthp, :maxhp, :status, :ball, :opower, :caught, :repeat, :turn_number, :enemy_level, :bug_water_type, :dive_surf_fish, :cave_night)
    #end
end
