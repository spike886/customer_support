module Api::V1
  class Customer::RequestController < Customer::BaseController
    before_action :set_request, only: [:show, :update, :destroy]

    # GET v1/customer/requests
    def index
      @requests = Request.all
      render json: @requests
    end

    # GET v1/customer/requests/1
    def show
      render json: @request
    end

    # POST v1/customer/requests
    def create
      @request = Request.build request_params
      @request.customer = current_customer

      if @request.save
        render json: @request, status: :created
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT v1/customer/requests/1
    def update
      if @request.update_attributes request_params
          render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    # DELETE v1/customer/requests/1
    def destroy
      @request.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:title, :description)
    end
  end
end