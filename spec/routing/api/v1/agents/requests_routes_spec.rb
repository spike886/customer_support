require 'spec_helper'

describe Api::V1::Agents::RequestsController do
  describe 'routing' do

    describe 'GET v1/agents/requests' do
      it 'routes to #index' do
        expect(get: v1_agents_requests_path).to route_to('api/v1/agents/requests#index')
      end
    end

    describe 'GET v1/agents/requests/1' do
      it 'routes to #show' do
        expect(get: v1_agents_request_path(1)).to route_to('api/v1/agents/requests#show', id: '1')
      end
    end

    describe 'PATCH v1/agents/requests/1' do
      it 'routes to #update' do
        expect(patch: v1_agents_request_path(1)).to route_to('api/v1/agents/requests#update', id: '1')
      end
    end
  end
end
