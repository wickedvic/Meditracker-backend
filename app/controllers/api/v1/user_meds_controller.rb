class Api::V1::UserMedsController < ApplicationController
    # skip_before_action :authorized


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

    private

    def pt_meds_params
        params.require(:user_med).permit(:time, :notes, :pill_count)
    end
end