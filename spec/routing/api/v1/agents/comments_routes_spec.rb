require 'spec_helper'

describe Api::V1::Agents::CommentsController do
  describe 'routing' do
    describe 'POST v1/agents/comments' do
      it 'routes to #create' do
        expect(post: v1_agents_request_comments_path(1)).to route_to('api/v1/agents/comments#create', request_id: '1')
      end
    end
  end
end
