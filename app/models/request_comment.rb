class RequestComment < ApplicationRecord
  belongs_to :author, polymorphic: true

  validates :text, presence: true
end
