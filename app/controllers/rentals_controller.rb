class RentalsController < ApplicationController

  def index
    @rentals = policy_scope(Rental)
  end


  def new
    @rental = Rental.new
    authorize @rental
  end

  def create

    @rental = Rental.new(rental_params)
    @art = Art.find(params[:art_id])

    authorize @rental

    @rental.art = @art
    @rental.user_id = current_user.id
    @rental.total_price = @art.price
    @art.available = false
    if @rental.save && @art.save
      redirect_to art_path(@art)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:address, :rental_start, :rental_end)
  end
end
