# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :authenticate_and_set_user
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        users = User.all
        json_response(users)
      end

      def show
        json_response(@user)
      end

      def create
        user = User.new(user_params)

        if user.save
          json_response(user, :created, location: api_v1_user_path(user))
        else
          json_response_error(user)
        end
      end

      def update
        if @user.update(user_params)
          json_response(@user)
        else
          json_response_error(@user)
        end
      end

      def destroy
        @user.destroy
      end

      private
        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    end
  end
end
