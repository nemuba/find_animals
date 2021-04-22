# frozen_string_literal: true

module Api
  module V1
    class GetLocationController < ApiController
      before_action :authenticate_and_set_user

      def index
        return render json: {
          status: "error",
          msg: [
            "Parametros inválidos! Parâmetros necessários: longitude, latitude"
          ]
        }, status: :unprocessable_entity unless params_valid?

        data = GetLocation.new(params[:longitude], params[:latitude]).perform

        json_response(data)
      end

      private
        def params_valid?
          params[:latitude].present? && params[:longitude].present?
        end
    end
  end
end
