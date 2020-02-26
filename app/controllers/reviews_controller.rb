class ReviewsController < ApplicationController
  before_action :find_art, only: [:new, :create, :edit, :update]
  before_action :find_review, only: [:edit, :update]

  def index
    @reviews = policy_scope(Review)
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.art = @art

    if @review.save
      redirect_to @art
    else
      render :new
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to @art
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def find_art
    @art = Art.find(params[:art_id])
  end

  def find_review
    @review = Review.find(params[:id])
    authorize @review
  end
end
