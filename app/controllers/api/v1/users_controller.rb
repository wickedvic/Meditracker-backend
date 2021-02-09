class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show 
        @patient = User.find(params[:id])
        render json: @patient, serializer: UserSerializer
    end
end 