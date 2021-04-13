# frozen_string_literal: true

module Api
  module V1
    class GetLocationController < ApiController
      def index
        return render json: {
          status: "error",
          msg: [
            "Parametros inválidos! Parâmetros necessários: longitude, latitude"
          ]
        }, status: :unprocessable_entity unless params_valid?

        byebug
        address = Geocoder.search([params[:longitude], params[:latitude]])

        return render json: { msg: "Location not found " } unless address.present?

        data = {
          location: {
            street: address.first.data["address"]["road"],
            neighborhood: address.first.data["address"]["suburb"],
            city: address.first.data["address"]["town"],
            state: address.first.data["address"]["state"],
            country: address.first.data["address"]["country"],
            zipcode: address.first.data["address"]["postcode"]
          }
        }

        json_response(data)
      end

      private
        def params_valid?
          params[:latitude].present? && params[:longitude].present?
        end
    end
  end
end
