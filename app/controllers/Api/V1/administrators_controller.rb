module Api
    module V1
        class AdministratorsController < ApplicationController
            before_action :authorize_request, only: [:slot]
            before_action :authorize_reviewer, only: [:slot_index]
            before_action :find_user, only: [:show, :update, :destroy]
             # GET /admins
        def index
            @users = Administrator.all
        end

        # GET /admins/{username}
        def show; end

        # POST /admins
        def create
            @user = Administrator.new(user_params)
            if @user.save
            render :show, status: :created
            else
            render json: { error: @user.errors.full_messages },
                    status: :unprocessable_entity
            end
        end


        def slot
            if @current_user.is_a?(Administrator)
              slot_obj = Slot.new(unit_id: params[:unit_id], reviewer_id: params[:reviewer_id])
              if slot_obj.save 
                  render json: {slot: "Slot was successfully added for this reviewer."}
              else
                  render json: {error: slot_obj.errors.full_messages}
              end
            else 
                render json: {error: "Only Admins are allowed to add reviewers to slot."}
            end
        end

        def slot_index
            render json: {slots: @current_user.slots}
        end
        

        # PUT /admins/{username}
        def update
            return if @user.update(user_update_params)

            render json: { error: @user.errors.full_messages },
                status: :unprocessable_entity
        end

            # DELETE /admins/{username}
        def destroy
            @user.destroy
        end

        private

        def find_user
            @user = Administrator.find_by_phone!(params[:id])
            
        rescue ActiveRecord::RecordNotFound
            render json: { error: 'User not found' }, status: :not_found
        end

        def user_params
            params.require(:administrator).permit(
              :name, :role, :email, :password, :password_confirmation, :phone, :hospital_id, :unit_id, :reviewer_id
            )
          end

          def slot_params
            parama.permit(
              :unit_id, :reviewer_id
            )
          end
        end
    end
end
