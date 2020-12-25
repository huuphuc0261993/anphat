class Api::PicturesController < ApplicationController
  def create
    @picture = Picture.new(image: params[:file])
    if @picture.save
      render json: @picture, status: 200
    else
      render json: { message: full_error(@picture) }, status: 422
    end
  end

  def destroy
    @picture = Picture.find_by(id: params[:id])
    if @picture.destroy
      @picture.errors.full_messages
      render json: { json: 'Banner was successfully deleted.' }
    else
      render json: {}
    end
  end
end
