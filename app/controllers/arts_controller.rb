class ArtsController < ApplicationController
  before_action :find_art, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        arts.name ILIKE :query \
        OR arts.artist ILIKE :query \
      "
      @arts = policy_scope(Art).where(sql_query, query: "%#{params[:query]}%")
    else
      @arts = policy_scope(Art)
    end
  end

  def show
    @art_geo = Art.find(params[:id]).geocode
    if @art_geo
      @markers =
            {
              lat: @art_geo.first,
              lng: @art_geo.last,
              infoWindow: render_to_string(partial: "info_window", locals: { art: @art })
              # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')

            }
    end
  end

  private

  def find_art
    @art = Art.find(params[:id])
    authorize @art
  end
end
