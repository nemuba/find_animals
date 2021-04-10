# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      before_action :authenticate_and_set_user
      before_action :set_category, only: [:show, :update, :destroy]

      # GET /categories
      def index
        categories = Category.all

        json_response(categories)
      end

      # GET /categories/1
      def show
        json_response(@category)
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          json_response(@category, :created, location: api_v1_category_path(@category))
        else
          json_response_error(@category)
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          json_response(@category)
        else
          json_response_error(@category)
        end
      end

      # DELETE /categories/1
      def destroy
        @category.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
          @category = Category.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def category_params
          params.require(:category).permit(:description)
        end
    end
  end
end
