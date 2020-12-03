module Api
    class CustomersController < ApplicationController
        def index
        @customers = Customer.all
        render json: @customers
        end
    end

    private
    def customers_params
        params.require(:customer).permit(:name, :phone, :email, :password)
    end
end