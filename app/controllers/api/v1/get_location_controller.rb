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

        address = Geocoder.search([params[:longitude], params[:latitude]]).first

        render json: { msg: "Location not found " } unless address.present?

        data = {
          location: {
            street: address.data["address"]["road"],
            neighborhood: address.data["address"]["suburb"],
            city: address.data["address"]["town"],
            state: address.data["address"]["state"],
            country: address.data["address"]["country"],
            zipcode: address.data["address"]["postcode"]
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
