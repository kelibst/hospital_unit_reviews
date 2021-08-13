class ReviewersController < ApplicationController
  before_action :set_reviewer, only: %i[ show update destroy, user_slot ]
  before_action :authorize_request, only: [:create]
  # GET /reviewers
  # GET /reviewers.json
  def index
    @reviewers = Reviewer.all.ordered_by_most_recent
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
        # SEND UPDATE EMAIL HERE
        ActiveCodeMailer.send_active_code_email(@reviewer).deliver
      render :show, status: :created, location: @reviewer
    else
      render json:{error: @reviewer.errors} , status: :unprocessable_entity
    end
  end

  def user_slot
    render json: {slots: @reviewer.slots}
  end

  # PATCH/PUT /reviewers/1
  # PATCH/PUT /reviewers/1.json
  def update
    if @reviewer.update(reviewer_params)
      render :show, status: :ok, location: @reviewer
    else
      render json: {error: @reviewer.errors} , status: :unprocessable_entity
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
      @reviewer = Reviewer.find_by_username!(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reviewer_params
      params.require(:reviewer).permit(:name, :address, :email, :sex, :phone, :hospital_id, :activecode)
    end
end
