class CampersController < ApplicationController
#      get '/campers', to: 'campers#index'
#   get '/campers/:id', to: 'campers#show'
#   post '/campers', to: 'campers#create'

   def index
      render json: Camper.all
   end

   def show
      camper = Camper.find_by(id: params[:id])
      if camper
         render json: camper, serializer: CamperRelationshipSerializer
      else
         render json: {error: 'Camper not found'}, status: :not_found
      end
   end

   def create
      camper = Camper.create!(camper_params)
      if camper.valid?
         render json: camper, status: :created
      else
         render json: {status: error, code: 422, message: 'validation errors'}
      end
   end

   private

   def camper_params
      params.permit(:name, :age)
   end

end
