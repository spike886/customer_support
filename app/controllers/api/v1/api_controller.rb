module Api::V1
  class ApiController < ActionController::API
    include ActionController::Serialization

    before_action :authenticate_request
  end
end

