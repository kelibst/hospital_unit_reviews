class ApplicationController < ActionController::API
    def not_found
        render json: { error: 'not_found' }
      end
    
      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user = Administrator.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { error: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { error: e.message }, status: :unauthorized
        end
      end

      def authorize_reviewer
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user = Reviewer.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { error: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { error: e.message }, status: :unauthorized
        end
      end
end
