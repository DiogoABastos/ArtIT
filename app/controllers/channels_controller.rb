class ChannelsController < ApplicationController

  def index
    @channels = policy_scope(Channel)
    @my_channels = current_user.channels
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

  def user
    @channel = Channel.find(params[:id])
    authorize @channel
    @user = User.new
  end

  def add
    @channel = Channel.find(params[:id])
    authorize @channel
    @user = User.where(user_params)
    if !@user.empty?
      if (@channel.users - @user).count < @channel.users.count
        render :user
      else
        @channel.users << @user
        redirect_to channels_path
      end
    else
      render :user
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
