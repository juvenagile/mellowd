class ReceivedMessagesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @message = @user.received_messages.build(message_params)

    if @message.save
      redirect_to chatroom_path(@message.chatroom), notice: "Message sent successfully"
    else
      redirect_to event_path(@event), alert: "Something went wrong"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
