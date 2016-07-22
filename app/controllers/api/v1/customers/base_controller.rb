module Api::V1
  class Customers::BaseController < ApiController
    attr_reader :current_customer
    serialization_scope :current_customer

    private

    def authenticate_request
      @current_customer = AuthorizeApiRequest.call(request.headers, Customer).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_customer
    end
  end
end
