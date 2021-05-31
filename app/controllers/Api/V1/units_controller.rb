module Api
  module V1
    class UnitsController < ApplicationController
      before_action :authorize_request
      before_action :set_unit, only: %i[ show update destroy ]

      # GET /units
      # GET /units.json
      def index
        @units = Unit.all
      end

      # GET /units/1
      # GET /units/1.json
      def show
      end

      # POST /units
      # POST /units.json
      def create
        @unit = Unit.new(unit_params)

        if @unit.save
          render :show, status: :created
        else
          render json: @unit.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /units/1
      # PATCH/PUT /units/1.json
      def update
        if @unit.update(unit_params)
          render :show, status: :ok, location: @unit
        else
          render json: @unit.errors, status: :unprocessable_entity
        end
      end

      # DELETE /units/1
      # DELETE /units/1.json
      def destroy
        @unit.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_unit
          @unit = Unit.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def unit_params
          params.require(:unit).permit(:name, :unithead, :administrator_id, :hospital_id)
        end
    end
  end
end
