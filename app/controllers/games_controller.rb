class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
 		@game.type_ids = params[:game][:type_ids]
 		@game.source_ids = params[:game][:source_ids]

  		if @game.save
    		redirect_to @game
  		else
    		render 'new'
		end
  	end

  	def show
  		@game = Game.find(params[:id])
	end

	def index
		@games = Game.all
	end


	private
		def game_params
  		params.require(:game).permit(:question_count, {:type_ids => []}, {:source_ids => []})
		end

end
