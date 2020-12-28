class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      InitServices::InitProduct.new(@product, params[:product][:pictures_ids]).perform
      render json: @product
    else
      render status: 403
    end
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    if @product&.update(product_params)
      InitServices::InitProduct.new(@product, params[:product][:pictures_ids]).perform
      render json: @product, status: 200
    else
      render json: { json: @product.error, status: :unprocessable_entity }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: { json: 'Product was successfully deleted.' }
    else
      render json: { json: @product.error, status: :unprocessable_entity }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :discount, :price_sale, :category_id, :youtube)
  end
end
