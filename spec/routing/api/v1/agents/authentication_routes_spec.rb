require 'spec_helper'

describe Api::V1::Agents::AuthenticationController do
  describe 'routing' do
    describe 'POST v1/agents/authenticate' do
      it 'routes to #create' do
        expect(post: v1_agents_authenticate_path).to route_to('api/v1/agents/authentication#authenticate')
      end
    end
  end
end
