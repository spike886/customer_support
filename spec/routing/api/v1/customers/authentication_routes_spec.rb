require 'spec_helper'

describe Api::V1::Customers::AuthenticationController do
  describe 'routing' do
    describe 'POST v1/customers/authenticate' do
      it 'routes to #create' do
        expect(post: v1_customers_authenticate_path).to route_to('api/v1/customers/authentication#authenticate')
      end
    end
  end
end
