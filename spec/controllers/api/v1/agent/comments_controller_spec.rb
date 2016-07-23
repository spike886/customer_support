require 'spec_helper'

describe Api::V1::Agents::CommentsController do
  login_as_agent
  let(:request_object) { create :request, agent: current_agent }

  describe "POST #create" do
    let(:params) { {params: {request_comment: attributes, request_id: request_object.id} } }

    context "with VALID attributes" do
      let(:attributes){ attributes_for :request_comment, request: request_object }

      it { expect{post :create, params}.to change(RequestComment, :count).by(1) }

      describe "response" do
        before{ post :create, params }
        subject{ response }

        its(:status) { is_expected.to eq 201 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { assert_serializer RequestCommentSerializer }
        end
      end

      describe "object" do
        before{ post :create, params }
        subject { RequestComment.last }

        its(:text) { is_expected.to eq attributes[:text] }
        its(:author) { is_expected.to eq current_agent }
      end
    end

    context "with INVALID attributes" do
      let(:attributes){ {invalid: true} }

      it { expect{post :create, params}.not_to change(RequestComment, :count) }

      describe "response" do
        before{ post :create, params }
        subject{ response }

        its(:status) { is_expected.to eq 422 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { is_expected.to include 'errors' }
        end
      end
    end
  end #create

end
