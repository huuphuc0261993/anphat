class Api::PicturesController < ApplicationController
    def def index
        @pictures = Picture.all
        render json: @pictures
    end

    # def create   
    #     @pictures = Picture.new(pictures_params)
    #     if @pictures.save
    #         render json: @pictures    
    #     else
    #         render json: { json: @pictures.errors, status: :unprocessable_entity }
    #     end
    # end

    # def show
    #     @pictures = Picture.find(params[:id])
    #     render json: { data: @pictures, status: :ok, message: 'Success' }
    # end

    # def update
    #     @pictures = Picture.find(params[:id])
    #     if @pictures.update(pictures_params)
    #         render json: { status: :ok, message: 'Success' }
    #     else
    #         render json: { json: @pictures.error, status: :unprocessable_entity }
    #     end
    # end

    # def destroy
    #     @pictures = Picture.find(params[:id])
    #     if @pictures.destroy
    #         render json: { json: 'Picture was successfully deleted.'}
    #     else
    #         render json: { json: @pictures.errors, status: :unprocessable_entity }
    #     end
    # end
    
    private

    def pictures_params
        params.require(:picture).permit(:id, :title, :product_id)
    end
end
