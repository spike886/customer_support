require 'spec_helper'

describe Api::V1::Customers::RequestsController do
  it_behaves_like "logged in as", :customer

  describe "POST #create" do
    let(:params) { {customer: attributes} }

    context "with VALID attributes" do
      let(:attributes){ attributes_for :request }

      it { expect{post :create, params}.to change(Request, :count).by(1) }

      describe "response" do
        before{ post :create, params }
        subject{ response }

        its(:status) { is_expected.to eq 200 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { is_expected.to include attributes }
        end
      end
    end

    context "with VALID attributes" do
      let(:attributes){ {invalid: true} }

      it { expect{post :create, params}.not_to change(Request, :count) }

      describe "response" do
        before{ post :create, params }
        subject{ response }

        its(:status) { is_expected.to eq 402 }

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

      describe "body" do
        subject{ JSON.parse(response.body) }

        it { is_expected.to include 'requests' }
      end
    end
  end #index

end
