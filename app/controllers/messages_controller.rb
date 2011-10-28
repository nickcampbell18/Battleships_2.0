class MessagesController < ApplicationController
  
  respond_to :html, :json
  
  def index
    p = Player.find_by_uuid(params[:player_id])
    @messages = p.messages
    respond_with @messages
  end
  
  def show
    p = Player.find_by_uuid(params[:player_id])
    @message = p.messages.find(params[:id])
    respond_with @message
  end

end
