class Api::V1::DoctorsController < ApplicationController
    before_action :authorized, only: [:profile]

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def show
        doctor = Doctor.find(params[:id])
        render json: doctor, include: :users
    end
end 
