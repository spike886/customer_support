class Request < ApplicationRecord
  STATUS_VALUES = %w{new in\ progress closed}

  belongs_to :customer
  belongs_to :agent
  has_many :request_comments

  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true
  validates :customer, presence: true
  validates :agent, presence: true, unless: Proc.new {|request| request.new? }
  validates :status, inclusion: { in: STATUS_VALUES }

  def new?
    status == 'new'
  end
end
