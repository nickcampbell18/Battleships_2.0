class GamesController < ApplicationController
  
  respond_to :html, :json
  
  def index
    @games = Game.all
    respond_with @games
  end
  
  def show
    @game = Game.find_by_uuid(params[:id])
    respond_with @game
  end
  
  def shoot
    @player = current_user
    h = params[:h]
    v = params[:v]
    l = params[:l]
    if h.nil? or v.nil? or l.nil? or @player.nil?
      render :text => '', :status => 400 # Bad request
    end
  end

end
