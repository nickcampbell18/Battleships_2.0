class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def logged_in
    #Does nothing yet
  end
  
  def permission_granted
    player_id = params[:player_id] || params[:id]
    redirect_to '/' unless player_id == current_user
  end
  
  def current_user
    p = Player.find_by_uuid(params[:player_uuid])
    # Auth override
    p = Player.first #gvn2o3b4
    p.nil? ? false : p.uuid
  end
  
end
