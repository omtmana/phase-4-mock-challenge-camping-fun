class ActivitiesController < ApplicationController
#      get '/activities', to: 'activities#index'
#   delete 'activities/:id', to: 'activities#destroy'

   def index
      render json: Activity.all
   end

   def destroy
      activity = Activity.find_by(id: params[:id])
      if !activity.nil?
         activity.signups.destroy_all
         activity.destroy
         render json: {message: 'Data Deleted'}
      else
         render json: {status: 'error', code: 404, message: 'Activity not found' }
      end
   end
end
