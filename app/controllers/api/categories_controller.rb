class Api::CategoriesController < ApplicationController
    def index
        # @categories = Category.where(deleted_at: nil)
        @categories = Category.all
        render json: @categories
    end

    def create   
        @categories = Category.new(categories_params)
        if @categories.save
            render json: @categories    
        else
            render json: { json: @categories.errors, status: :unprocessable_entity }
        end
    end

    def show
        @categories = Category.find(params[:id])
        render json: { data: @categories, status: :ok, message: 'Success' }
    end

    def update
        @categories = Category.find(params[:id])
        if @categories.update(categories_params)
            render json: { status: :ok, message: 'Success' }
        else
            render json: { json: @categories.error, status: :unprocessable_entity }
        end
    end

    def destroy
        @categories = Category.find(params[:id])
        if @categories.destroy
            render json: { json: 'Category was successfully deleted.'}
        else
            render json: { json: @categories.errors, status: :unprocessable_entity }
        end
    end
    
    private
    def categories_params
        params.require(:category).permit(:id, :name)
    end
end