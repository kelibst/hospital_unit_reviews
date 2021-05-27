module Api
    module V1
        class AdministratorsController < ApplicationController
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
            render json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        # PUT /admins/{username}
        def update
            return if @user.update(user_update_params)

            render json: { errors: @user.errors.full_messages },
                status: :unprocessable_entity
        end

            # DELETE /admins/{username}
        def destroy
            @user.destroy
        end

        private

        def find_user
            @user = User.find_by_id!(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
        end

        def user_params
            params.require(:administrator).permit(
              :name, :role, :email, :password, :password_confirmation, :phone, :hospital_id
            )
          end
        end
    end
end
