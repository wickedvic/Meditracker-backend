class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show 
        @user = User.find(params[:id])
        render json: @user, serializer: UserSerializer
    end
end 