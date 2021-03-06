require 'spec_helper'

describe Api::V1::Customers::RequestsController do
  login_as_customer

  describe "POST #create" do
    let(:params) { {params: {request: attributes} } }

    context "with VALID attributes" do
      let(:attributes){ attributes_for :request }

      it { expect{post :create, params}.to change(Request, :count).by(1) }

      describe "response" do
        before{ post :create, params }
        subject{ response }

        its(:status) { is_expected.to eq 201 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { assert_serializer RequestSerializer }
        end
      end

      describe "object" do
        before{ post :create, params }
        subject { Request.last }

        its(:title) { is_expected.to eq attributes[:title] }
        its(:description) { is_expected.to eq attributes[:description] }
      end
    end

    context "with INVALID attributes" do
      let(:attributes){ {invalid: true} }

      it { expect{post :create, params}.not_to change(Request, :count) }

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

  describe "PUT #update" do
    let(:request_object) { create :request, customer: current_customer }
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
      let(:attributes){ { title: nil, description: nil } }

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
    let(:request_object) { create :request, customer: current_customer }

    describe "response" do
      before { get :show, params: { id: request_object.id } }
      subject{ response }

      its(:status) { is_expected.to eq 200 }

      it { assert_serializer RequestSerializer }
    end
  end #show

end
