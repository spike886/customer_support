require 'rails_helper'

describe Api::V1::Agents::AuthenticationController do
  let(:agent) { create :agent }

  describe "POST #authenticate" do
    let(:params) { {params: {email: email, password: password} } }
    let(:email) { agent.email }

    context "with VALID attributes" do
      let(:password){ agent.password }

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

          it { is_expected.to include 'errors' }
        end
      end
    end
  end #authenticate

end
