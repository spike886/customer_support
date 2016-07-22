
shared_examples 'logged in as' do | type |
  let(:"current_#{type}") { create type }
  let(:api_token) { JsonWebToken.encode(user_id: send("current_#{type}").id) }
  before { request.headers['Authorization'] = api_token }
end