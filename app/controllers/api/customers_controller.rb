module Api
  class CustomersController < ApplicationController
    def index
      @customers = Customer.all
      render json: @customers
    end

    def create
      @customer = Customer.new(customer_params)
      if @customer.save
        render json: @customer
      else
        render json: { json: @customer.errors, status: :unprocessable_entity }
      end
    end

    def show
      @customer = Customer.find(params[:id])
      render json: { data: @customer, status: :ok, message: 'Success' }
    end

    def update
      @customers = Customer.find(params[:id])
      if @customer.update(customers_params)
        render json: { status: :ok, message: 'Success' }
      else
        render json: { json: @customer.error, status: :unprocessable_entity }
      end
    end

    def destroy
      @customer = Customer.find(params[:id])
      if @customer.destroy
        render json: { json: 'Customer was successfully deleted.' }
      else
        render json: { json: @customer.errors, status: :unprocessable_entity }
      end
    end

    private

    def customer_params
      params.require(:customer).permit(:name, :phone, :email, :encrypted_password)
    end
  end
end
