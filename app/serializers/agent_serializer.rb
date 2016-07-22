class AgentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :requests
end
