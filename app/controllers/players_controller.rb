class PlayersController < ApplicationController

  respond_to :html, :json
  
  def index
    @g = Game.find_by_uuid(params[:game_id])
    @players = @g.players.all
    respond_with @players
  end
  
  def show
    @player = Player.find_by_uuid(params[:id])
    respond_with @player
  end
end
