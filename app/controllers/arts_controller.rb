class ArtsController < ApplicationController
  before_action :find_art, only: [:show]

  def index
    @arts = Art.all
  end

  def show; end

  private

  def find_art
    @art = Art.find(params[:id])
  end
end
