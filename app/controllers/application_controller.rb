class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def logout
    reset_session
    redirect_to :home
  end
  
  def login
    session[:player_uuid] = params[:uuid]
    player = Player.find_by_uuid(params[:uuid])
    redirect_to player
  end

  private
  
  def logged_in
    current_user == false ? false : true
  end
  
  def permission_granted
    player_id = params[:player_id] || params[:id]
    # 403 Not Authorized error
    render :text => '', :status => 403 if player_id != current_user
  end
  
  def current_user
    p = Player.find_by_uuid(session[:player_uuid])
    p.nil? ? false : p.uuid
  end
  
end
