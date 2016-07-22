module Api::V1
  class Agents::RequestsController < Agents::BaseController
    before_action :set_request, only: [:show, :update]

    # GET v1/agent/requests
    def index
      @requests = Request.all
      render json: @requests
    end

    # GET v1/agent/requests/1
    def show
      render json: @request
    end

    # PATCH/PUT v1/agent/requests/1
    def update
      params[:request][:agent_id] = current_agent.id
      if @request.update_attributes request_params
          render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:status, :agent_id)
    end

    def serializer_method
      defined?(@request) ? RequestsSerializer : RequestSerializer
    end
  end
end