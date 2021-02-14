class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :update]

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show 
        @patient = User.find(params[:id])
        render json: @patient, serializer: UserSerializer
    end

    def create 
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else 
            render json: { error: 'failed to create patient' }, status: :not_acceptable
        end 
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

private
    def user_params
        params.require(:user).permit(:name, :password_digest, :email, :image, :doctor_id)
    end
end 