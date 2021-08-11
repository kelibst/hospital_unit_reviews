class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]
  before_action :authorize_reviewer
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all.ordered_by_most_recent
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end


  # POST /reviews
  # POST /reviews.json
  def create
    @slots = Slot.where(unit_id: review_params[:unit_id], reviewer_id:  review_params[:reviewer_id])
    if @slots.empty?
      render json: {error: "You do not have a slot to review this unit."}
      else  
      @review = Review.new(review_params)
      if @review.save
        @slots.first.destroy
        render :show, status: :created, location: @review
      else
        render json: @review.errors, status: :unprocessable_entity
      end
     
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      render :show, status: :ok, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:title, :description, :score, :unit_id, :reviewer_id)
    end
end
