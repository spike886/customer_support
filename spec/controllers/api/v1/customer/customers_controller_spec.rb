require 'spec_helper'

describe Api::V1::Customers::CustomersController do

  describe "POST #create" do
    let(:params) { {customer: attributes} }

    context "with VALID attributes" do
      let(:attributes){ attributes_for :customer }

      it { expect{post :create, params}.to change(Customer, :count).by(1) }

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

      it { expect{post :create, params}.not_to change(Customer, :count) }

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

end
