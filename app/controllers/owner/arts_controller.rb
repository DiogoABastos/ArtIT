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
      redirect_to art_path(@art)
    else
      render :new
    end
  end

  def edit; end

  def update
    @art.update(art_params)
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
  end
end
