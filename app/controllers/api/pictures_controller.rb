class Api::PicturesController < ApplicationController
  def create
    @picture = Picture.new(image: params[:file])
    if @picture.save
      render json: @picture, status: 200
    else
      render json: { message: full_error(@image) }, status: 422
    end
  end
end
