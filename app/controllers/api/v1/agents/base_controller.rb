module Api::V1
  class Agents::BaseController < ApiController
    attr_reader :current_agent
    serialization_scope :current_agent

    private

    def authenticate_request
      @current_agent = AuthorizeApiRequest.call(request.headers, Agent).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_agent
    end
  end
end