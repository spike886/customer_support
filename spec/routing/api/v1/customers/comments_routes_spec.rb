require 'spec_helper'

describe Api::V1::Customers::CommentsController do
  describe 'routing' do
    describe 'POST v1/customers/comments' do
      it 'routes to #create' do
        expect(post: v1_customers_request_comments_path(1)).to route_to('api/v1/customers/comments#create', request_id: '1')
      end
    end
  end
end
