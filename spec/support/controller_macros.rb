module ControllerMacros
  def login_as_customer
    login_as :customer
  end

  def login_as_agent
    login_as :agent
  end

  private

  def login_as(type)
    let(:"current_#{type}") { create type }
    let(:api_token) { JsonWebToken.encode(user_id: send("current_#{type}").id) }
    before { request.headers['Authorization'] = api_token }
  end
end
