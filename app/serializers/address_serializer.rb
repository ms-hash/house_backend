class AddressSerializer < ActiveModel::Serializer
  attributes :id, :prefecture, :city, :suite
end
