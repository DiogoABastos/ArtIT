class MessagesController < ApplicationController

  def index
    @messages = policy_scope(Message)
    @message = Message.new
  end

  def new; end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.user = current_user

    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
