module Api
  class BannersController < ApplicationController
    def index
      @banners = Banner.all
      render json: @banners
    end
  
    def create
      @banners = Banner.new(products_params)
      if @banners.save
        InitServices::InitProduct.new(@banners, params[:banner][:pictures_ids]).perform
        render json: @banners
      else
        render status: 403
      end
    end
  
    def show
      @banners = Banner.find(params[:id])
      render json: { data: @banners, status: :ok, message: 'Success' }
    end
  
    def update
      @banners = Banner.find(params[:id])
      if @banners&.update(products_params)
        InitServices::InitProduct.new(@banners, params[:banner][:pictures_ids]).perform
        render json: @banners, status: 200
      else
        render json: { json: @banners.error, status: :unprocessable_entity }
      end
    end
  
    def destroy
      @banners = Banner.find(params[:id])
      if @banners.destroy
        render json: { json: 'Banner was successfully deleted.' }
      else
        render json
      end
    end
  
    private
  
    def products_params
      params.require(:banner).permit(:banner_type)
    end
  end
end
