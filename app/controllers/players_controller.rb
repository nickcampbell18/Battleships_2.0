class PlayersController < ApplicationController

  respond_to :html, :json
  before_filter :logged_in, :permission_granted
  
  def show
    @player = Player.find_by_uuid(params[:id])
    respond_with @player
  end
end
