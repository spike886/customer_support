class RequestsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status
  has_one :customer
  has_one :agent
end
