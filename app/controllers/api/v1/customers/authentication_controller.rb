module Api::V1
  class Customers::AuthenticationController < Customers::BaseController
    skip_before_action :authenticate_request

    # POST v1/customer/authenticate
    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password], Customer)

      if command.success?
        render json: { auth_token: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
  end
end
