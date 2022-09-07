class SignupsController < ApplicationController

   def create
      signup = Signup.create!(signup_params)
      if signup.valid?
         render json: signup.activity
      else
         render json: {status: error, code: 422, message: 'validation errors'}
      end
   end

   private

   def signup_params
      params.permit(:time, :camper_id, :activity_id )
   end
end
