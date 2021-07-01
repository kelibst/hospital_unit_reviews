module Api
    module V1
        class HospitalsController < ApplicationController  
            before_action :authorize_request, except: [:create, :index, :show]
            before_action :set_hospital, only: %i[ show update destroy ]
            # GET /hospitals
            # GET /hospitals.json
            def index
                @hospitals = Hospital.all
            end

            # GET /hospitals/1
            # GET /hospitals/1.json
            def show
            end

            # POST /hosptials
            # POST /hosptials.json
            def create
                unless Hospital.first 
                     @hospital = Hospital.new(hospital_params)

                if @hospital.save
                    render :show, status: :created, location: @unit
                else
                    render json: @hospital.errors, status: :unprocessable_entity
                end
            else 
                render json: { error: {"AccountExist": "Only one Hospital is acceptable per installation"} }, status: :unprocessable_entity
            end
            end

            # PATCH/PUT /hosptials/1
            # PATCH/PUT /hosptials/1.json
            def update
                if @hospital.update(hospital_params)
                    render :show, status: :ok, location: @hospital
                else
                    render json: @hospital.errors, status: :unprocessable_entity
                end
            end

            # DELETE /hosptials/1
            # DELETE /hosptials/1.json
            def destroy
                @hospital.destroy
            end

            private
            # Use callbacks to share common setup or constraints between actions.
            def set_hospital
                @hospital = Hospital.find(params[:id])
            end

            # Only allow a list of trusted parameters through.
            def hospital_params
                params.require(:hospital).permit(:name, :start_date, :country, :region, :address)
            end
        end
    end
end
