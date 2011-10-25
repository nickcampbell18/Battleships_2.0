class ShipsController < ApplicationController

  respond_to :html, :json
  
  def index
    p = Player.find_by_uuid(params[:player_id])
    #@g = @p.game
    @ships = p.ships
    respond_with @ships
  end

end
