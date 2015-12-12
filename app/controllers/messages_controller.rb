class MessagesController < ApplicationController
  load_and_authorize_resource :message
  def create
    @message.user_id = current_user.id

    if @message.save
      #PrivatePub.publish_to("/messages/new")
    else
      render plain: @message.errors.full_messages
    end

  end

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end
end