module Api::V1
  class Agents::AuthenticationController < Agents::BaseController
    skip_before_action :authenticate_request

    # POST v1/agent/authenticate
    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password], Agent)

      if command.success?
        render json: { auth_token: command.result }
      else
        render json: { errors: command.errors }, status: :unauthorized
      end
    end
  end
end
