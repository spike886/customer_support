require 'rails_helper'

describe Api::V1::Customers::AuthenticationController do
  let(:customer) { create :customer }

  describe "POST #authenticate" do
    let(:params) { {email: email, password: password} }
    let(:email) { customer.email }

    context "with VALID attributes" do
      let(:password){ customer.password }

      describe "response" do
        before{ post :authenticate, params }
        subject{ response }

        its(:status) { is_expected.to eq 200 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { is_expected.to include 'auth_token' }
        end
      end
    end

    context "with VALID attributes" do
      let(:password){ 'invalid' }

      describe "response" do
        before{ post :authenticate, params }
        subject{ response }

        its(:status) { is_expected.to eq 401 }

        describe "body" do
          subject{ JSON.parse(response.body) }

          it { is_expected.to include 'error' }
        end
      end
    end
  end #authenticate

end
