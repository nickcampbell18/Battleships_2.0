class ShipsController < ApplicationController

  respond_to :html, :json
  before_filter :logged_in, :permission_granted
  
  def index
    p = Player.find_by_uuid(params[:player_id])
    @ships = p.ships
    respond_with @ships
  end
  
  def show
    p = Player.find_by_uuid(params[:player_id])
    @ship = p.ships.find_by_l(params[:id])
    respond_with @ship
  end
  
  def create
    @ship = Ship.new(params[:ship])
    if @ship.save
      cookies[:last_ship_id] = @ship.id
      flash[:notice] = "Successfully created ship."
    end
    respond_with @ship
  end
  
  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy
    flash[:notice] = "Deleted ship"
    respond_with @ship
  end

end
