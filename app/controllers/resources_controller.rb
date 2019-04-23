# frozen_string_literal: true

class ResourcesController < ApplicationController
  def index
    render json: Resource.all
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
    params.require(:resource).permit(:id, :title, :attached_file)
  end
end
