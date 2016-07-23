module Api::V1
  class Customers::RequestsController < Customers::BaseController
    before_action :set_request, only: [:show, :update]

    # GET v1/customer/requests
    def index
      @requests = current_customer.requests
      render json: @requests
    end

    # GET v1/customer/requests/1
    def show
      render json: @request, include: :request_comments
    end

    # POST v1/customer/requests
    def create
      @request = Request.new request_params
      @request.customer = current_customer

      if @request.save
        render json: @request, status: :created
      else
        render json: { errors: @request.errors } , status: :unprocessable_entity
      end
    end

    # PATCH/PUT v1/customer/requests/1
    def update
      if @request.update_attributes request_params
          render json: @request
      else
        render json: { errors: @request.errors } , status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = current_customer.requests.find params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:title, :description)
    end

    def serializer_method
      defined?(@request) ? RequestsSerializer : RequestSerializer
    end
  end
end