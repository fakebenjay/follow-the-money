class OfficialSerializer < ActiveModel::Serializer
  attributes :id, :name, :state_id, :district, :office, :party_id
end
