class Owner::ArtsController < ApplicationController
  before_action :find_art, only: [:show, :edit, :update, :destroy]

  def index
    @arts = current_user.arts
  end

  def show; end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user_id = current_user.id
    if @art.save
      redirect_to owner_art_path(@art)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @art.update(art_params)
      redirect_to owner_art_path(@art)
    else
      render :edit
    end
  end

  def destroy
    @art.destroy

    redirect_to owner_arts_path
  end

  private

  def art_params
    params.require(:art).permit(:name, :artist, :style, :era, :price, :description, :address, :photo)
  end

  def find_art
    @art = Art.find(params[:id])
  end
end
