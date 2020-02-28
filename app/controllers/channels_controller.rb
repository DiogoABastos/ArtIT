class ChannelsController < ApplicationController

  def index
    @channels = policy_scope(Channel)
  end

  def new
    @channel = Channel.new
    authorize @channel
  end

  def create
    @channel = Channel.new(channel_params)
    authorize @channel
    @channel.users << current_user

    if @channel.save
      redirect_to channels_path
    else
      render :new
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
