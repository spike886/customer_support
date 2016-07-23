require 'spec_helper'

describe Api::V1::Customers::CustomersController do

  describe "POST #create" do
    let(:params) { {params: {customer: attributes} } }

    context "with VALID attributes" do
      let(:attributes){ attributes_for :customer }

      it { expect{post :create, params}.to change(Customer, :count).by(1) }

      describe "response" do
        subject{ response }
        before{ post :create, params }
        let(:created_customer) { Customer.last }

        its(:status) { is_expected.to eq 201 }

        it { assert_serializer CustomerSerializer }
      end

      describe "object" do
        before{ post :create, params }
        subject { Customer.last }

        its(:name) { is_expected.to eq attributes[:name] }
        its(:email) { is_expected.to eq attributes[:email] }
      end
    end

    context "with VALID attributes" do
      let(:attributes){ {invalid: true} }

      it { expect{post :create, params}.not_to change(Customer, :count) }

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
