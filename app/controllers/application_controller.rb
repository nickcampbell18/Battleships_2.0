class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def logout
    reset_session
    redirect_to :home
  end
  
  def login
    session[:player_uuid] = params[:uuid]
    redirect_to '/p/gvn2o3b4.json'
  end

  private
  
  def logged_in
    true
    #Does nothing yet
  end
  
  def permission_granted
    player_id = params[:player_id] || params[:id]
    # 403 Not Authorized error
    render :text => '', :status => 403 unless player_id == current_user
  end
  
  def current_user
    p = Player.find_by_uuid(session[:player_uuid])
    # Auth override
    p.nil? ? false : p.uuid
  end
  
end
