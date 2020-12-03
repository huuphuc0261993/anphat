module Api
    class BannersController < ApplicationController
    def index
        @banners = Banner.all
        render json: @banners
        end
    
        def create
        @banners = Banner.new(banners_params)
        if @banners.save
            render json: { status: :ok, message: 'Success' }
        else
            render json: { json: @banners.errors, status: :unprocessable_entity }
        end
        end
    
        def show
        @banners = Banner.find(params[:id])
        render json: { data: @banners, status: :ok, message: 'Success' }
        end
    
        def update
        @banners = Banner.find(params[:id])
        if @banners.update(banners_params)
            render json: { status: :ok, message: 'Success' }
        else
            render json: { json: @banners.error, status: :unprocessable_entity }
        end
        end
    
        def destroy
        @banners = Banner.find(params[:id])
        if @banners.destroy
            render json: { json: 'Banner was successfully deleted.'}
        else
            render json: { json: @banners.errors, status: :unprocessable_entity }
        end
        end

        private
        def banners_params
            params.require(:banner).permit(:id, :name, :banner_type)
        end
    end
end