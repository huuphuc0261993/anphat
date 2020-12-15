class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def create
    @products = Product.new(products_params)
    if @products.save
      InitServices::InitProduct.new(@products, params[:product][:pictures_ids]).perform
      render json: @products
    else
      render status: 403
    end
  end

  def show
    @products = Product.find(params[:id])
    render json: { data: @products, status: :ok, message: 'Success' }
  end

  def update
    @products = Product.find(params[:id])
    if @products&.update(products_params)
      InitServices::InitProduct.new(@products, params[:product][:pictures_ids]).perform
      render json: @products, status: 200
    else
      render json: { json: @products.error, status: :unprocessable_entity }
    end
  end

  def destroy
    @products = Product.find(params[:id])
    if @products.destroy
      render json: { json: 'Product was successfully deleted.' }
    else
      render json
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :price, :description, :discount, :price_sale, :category_id)
  end
end
