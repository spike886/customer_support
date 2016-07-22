class AuthorizeApiRequest
  prepend SimpleCommand
  def initialize(headers = {}, klass)
    @headers = headers
    @klass = klass
  end

  def call
    user
  end

  private

  attr_reader :headers, :klass

  def user
    @user ||= klass.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end