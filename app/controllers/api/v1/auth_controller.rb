# frozen_string_literal: true

module Api
  module V1
    class AuthController < ApiController
      before_action :authenticate_and_set_user

      def index
        json_response(current_user)
      end
    end
  end
end
