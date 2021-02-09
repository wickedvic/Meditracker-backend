class Api::V1::UserMedsController < ApplicationController
    skip_before_action :authorized

    
    def update 
        @pt_med = UserMed.find(params[:id])
        @pt_med.update(pt_meds_params)
        render json: @pt_med
    end

    def destroy
    med = UserMed.find(params[:id])
        med.destroy
        render json: med
    end

    def create
        med = UserMed.create!(pt_meds_params)
        render json: med, serializer: UserMedSerializer
    end


    private

    def pt_meds_params
        params.require(:user_med).permit(:user_id, :med_id, :time, :notes, :pill_count, :has_taken)
    end
end