require 'spec_helper'

describe Api::V1::Agents::RequestsController do
  login_as_agent

  describe "PUT #update" do
    let(:request_object) { create :request, agent: current_agent }
    let(:params) { {params: {request: attributes, id: request_object.id} } }

    context "with VALID attributes" do
      let(:attributes){ attributes_for :request }

      describe "response" do
        before{ put :update, params }
        subject{ response }

        its(:status) { is_expected.to eq 200 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { assert_serializer RequestSerializer }
        end
      end

      describe "object" do
        before{ put :update, params }
        subject { request_object.reload }

        its(:title) { is_expected.to eq attributes[:title] }
        its(:description) { is_expected.to eq attributes[:description] }
      end
    end

    context "with INVALID attributes" do
      let(:attributes){ { status: 'invalid' } }

      describe "response" do
        before{ put :update, params }
        subject{ response }

        its(:status) { is_expected.to eq 422 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { is_expected.to include 'errors' }
        end
      end
    end
  end #create

  describe "POST #index" do
    let(:requests) { create_list :requests, 2 }

    describe "response" do
      before { get :index }
      subject{ response }

      its(:status) { is_expected.to eq 200 }

      it { assert_serializer 'ActiveModel::Serializer::CollectionSerializer' }
    end
  end #index

  describe "GET #show" do
    let(:request_object) { create :request, agent: current_agent }

    describe "response" do
      before { get :show, params: { id: request_object.id } }
      subject{ response }

      its(:status) { is_expected.to eq 200 }

      it { assert_serializer RequestSerializer }
    end
  end #show

end
