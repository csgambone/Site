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

	def edit
  		@game = Game.find(params[:id])
	end

	def update
  	@game = Game.find(params[:id])
 
  	if @game.update(game_params)
    	redirect_to @game
  	else
    	render 'edit'
  	end
  end


	private
		def game_params
  		params.require(:game).permit(:question_count, {:type_ids => []}, {:source_ids => []})
		end

end
