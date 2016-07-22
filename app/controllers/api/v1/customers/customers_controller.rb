module Api::V1
  class Customers::CustomersController < Customers::BaseController
    skip_before_action :authenticate_request

    # POST v1/customer/customers
    def create
      @customer = Customer.build customer_params

      if @customer.save
        render json: @customer, status: :created, location: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    private

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:request).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
