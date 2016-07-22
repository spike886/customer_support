require 'spec_helper'

describe Api::V1::Customers::CustomersController do
  describe 'routing' do
    describe 'POST v1/customers/customers' do
      it 'routes to #create' do
        expect(post: v1_customers_customers_path).to route_to('api/v1/customers/customers#create')
      end
    end
  end
end
