require 'spec_helper'

describe Api::V1::Customers::RequestsController do
  describe 'routing' do
    describe 'POST v1/customers/requests' do
      it 'routes to #create' do
        expect(post: v1_customers_requests_path).to route_to('api/v1/customers/requests#create')
      end
    end

    describe 'GET v1/customers/requests' do
      it 'routes to #index' do
        expect(get: v1_customers_requests_path).to route_to('api/v1/customers/requests#index')
      end
    end

    describe 'GET v1/customers/requests/1' do
      it 'routes to #show' do
        expect(get: v1_customers_request_path(1)).to route_to('api/v1/customers/requests#show', id: '1')
      end
    end

    describe 'PATCH v1/customers/requests/1' do
      it 'routes to #update' do
        expect(patch: v1_customers_request_path(1)).to route_to('api/v1/customers/requests#update', id: '1')
      end
    end
  end
end
