# frozen_string_literal: true

module Api
  module V1
    class AnimalsController < ApiController
      before_action :authenticate_and_set_user
      before_action :set_animal, only: [:show, :update, :destroy]

      # GET /animals
      def index
        animals = Animal.all

        json_response(animals)
      end

      # GET /animals/1
      def show
        json_response(@animal)
      end

      # POST /animals
      def create
        @animal = current_user.animals.new(animal_params)

        if @animal.save
          json_response(@animal, :created, location: api_v1_animal_path(@animal))
        else
          json_response_error(@animal)
        end
      end

      # PATCH/PUT /animals/1
      def update
        if @animal.update(animal_params)
          json_response(@animal)
        else
          json_response_error(@animal)
        end
      end

      # DELETE /animals/1
      def destroy
        @animal.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_animal
          @animal = Animal.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def animal_params
          params.require(:animal).permit(
            :name_owner,
            :phone_owner,
            :name,
            :description,
            :street,
            :number,
            :city,
            :zipcode,
            :state,
            :neighborhood,
            :country,
            :latitude,
            :longitude,
            :category_id
          )
        end
    end
  end
end
