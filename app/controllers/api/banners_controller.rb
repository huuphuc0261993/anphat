module Api
  class BannersController < ApplicationController
    def index
      @banners = Banner.all
      render json: @banners
    end
  
    def create
      @banner = Banner.new(banner_params)
      if @banner.save
        InitServices::InitProduct.new(@banner, params[:banner][:pictures_ids]).perform
        render json: @banner
      else
        render status: 403
      end
    end
  
    def show
      @banner = Banner.find(params[:id])
      render json: { data: @banner, status: :ok, message: 'Success' }
    end
  
    def update
      @banner = Banner.find(params[:id])
      if @banner&.update(banner_params)
        InitServices::InitProduct.new(@banner, params[:banner][:pictures_ids]).perform
        render json: @banner, status: 200
      else
        render json: { json: @banner.error, status: :unprocessable_entity }
      end
    end
  
    def destroy
      @banner = Banner.find(params[:id])
      if @banner.destroy
        render json: { json: 'Banner was successfully deleted.' }
      else
        render json: {}
      end
    end
  
    private
  
    def banner_params
      params.require(:banner).permit(:banner_type)
    end
  end
end
