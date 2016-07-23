class Agent < ApplicationRecord
  has_secure_password

  has_many :requests
  has_many :request_comments, as: :author

  validates :password, presence: true, length: {minimum: 5, maximum: 40}, confirmation: true
  validates :name, presence: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
end
