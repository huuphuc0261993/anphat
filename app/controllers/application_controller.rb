class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render json: resource
    else
      render json: resource.errors, status: 400
    end
  end
end
