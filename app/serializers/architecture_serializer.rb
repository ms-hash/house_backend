class ArchitectureSerializer < ActiveModel::Serializer
  attributes :id, :name, :imageUrl
  belongs_to :address, serializer: AddressSerializer
  belongs_to :category, serializer: CategorySerializer
end
