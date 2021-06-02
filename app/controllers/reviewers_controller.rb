class ReviewersController < ApplicationController
  before_action :set_reviewer, only: %i[ show update destroy ]

  # GET /reviewers
  # GET /reviewers.json
  def index
    @reviewers = Reviewer.all
  end

  # GET /reviewers/1
  # GET /reviewers/1.json
  def show
  end

  # POST /reviewers
  # POST /reviewers.json
  def create
    @reviewer = Reviewer.new(reviewer_params)

    if @reviewer.save
      render :show, status: :created, location: @reviewer
    else
      render json: @reviewer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviewers/1
  # PATCH/PUT /reviewers/1.json
  def update
    if @reviewer.update(reviewer_params)
      render :show, status: :ok, location: @reviewer
    else
      render json: @reviewer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviewers/1
  # DELETE /reviewers/1.json
  def destroy
    @reviewer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewer
      @reviewer = Reviewer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reviewer_params
      params.require(:reviewer).permit(:name, :address, :email, :phone, :hospital_id, :activecode)
    end
end
