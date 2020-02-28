class MessagesController < ApplicationController

  def index
    @messages = policy_scope(Message)
    @message = Message.new
    @channel = Channel.find(params[:channel_id])
    @channels = Channel.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new; end

  def create
    @message = Message.new(message_params)
    authorize @message
    channel = Channel.find(params[:channel_id])
    @message.user = current_user
    @message.channel = channel

    if @message.save
      redirect_to channel_messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
