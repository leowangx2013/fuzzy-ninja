class ConversationsController < ApplicationController
  load_and_authorize_resource :conversation
  def show
    @message = Message.new
  end

  def index
  end
end