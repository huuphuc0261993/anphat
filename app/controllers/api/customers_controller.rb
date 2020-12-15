module Api
  class CustomersController < ApplicationController
    def index
      # @customers = Customer.where(deleted_at: nil)
      @customers = Customer.all
      render json: @customers
    end

    def create
      @customers = Customer.new(customers_params)
      if @customers.save
        render json: @customers
      else
        render json: { json: @customers.errors, status: :unprocessable_entity }
      end
    end

    def show
      @customers = Customer.find(params[:id])
      render json: { data: @customers, status: :ok, message: 'Success' }
    end

    def update
      @customers = Customer.find(params[:id])
      if @customers.update(customers_params)
        render json: { status: :ok, message: 'Success' }
      else
        render json: { json: @customers.error, status: :unprocessable_entity }
      end
    end

    def destroy
      @customers = Customer.find(params[:id])
      if @customers.destroy
        render json: { json: 'Customer was successfully deleted.' }
      else
        render json: { json: @news.errors, status: :unprocessable_entity }
      end
    end

    private

    def customers_params
      params.require(:customer).permit(:name, :phone, :email)
    end
  end
end
