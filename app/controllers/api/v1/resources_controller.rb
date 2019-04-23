# frozen_string_literal: true

module Api
  module V1
    class ResourcesController < ApplicationController
      def index
        render json: Resource.with_attached_attached_file
      end

      def create
        resource = Resource.create(resource_params)
        render json: resource
      end

      def destroy
        Resource.destroy(params[:id])
      end

      def update
        resource = Resource.find(params[:id])
        resource.update_attributes(resource_params)
        render json: resource
      end

      private

      def resource_params
        params.require(:resource).permit(:id, :title, :description, :url)
      end
    end
  end
end

