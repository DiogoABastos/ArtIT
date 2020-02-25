class Owner::ArtsController < ApplicationController
  before_action :find_art, only: [:show, :edit, :update, :destroy]

  def index
    @arts = policy_scope([:owner, Art])
  end

  def show; end

  def new
    @art = Art.new
    authorize([:owner, @art])
  end

  def create
    @art = Art.new(art_params)
    @art.user_id = current_user.id

    authorize([:owner, @art])

    if @art.save
      redirect_to owner_art_path(@art)
    else
      render :new
    end
  end

  def edit; end

  def update
    @art.update(art_params)
    redirect_to owner_art_path(@art)
  end

  def destroy
    @art.destroy

    redirect_to owner_arts_path
  end

  private

  def art_params
    params.require(:art).permit(:name, :artist, :style, :era, :price, :description, :address)
  end

  def find_art
    @art = Art.find(params[:id])
    authorize([:owner, @art])
  end
end
