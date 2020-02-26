class ArtsController < ApplicationController
  before_action :find_art, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @arts = policy_scope(Art.geocoded)
    @markers = @arts.map do |art|
      {
        lat: art.latitude,
        lng: art.longitude
      }
    end
  end

  def show; end

  private

  def find_art
    @art = Art.find(params[:id])
    authorize @art
  end
end
