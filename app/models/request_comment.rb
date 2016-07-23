class RequestComment < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :request

  validates :text, presence: true
end
