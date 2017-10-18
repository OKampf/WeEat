class RestaurantSerializer < ActiveModel::Serializer
  # attributes :id
  #attributes *Tag.column_names
  attributes :id, :name, :rating, :accept_10bis, :address, :max_delivery_time, :reviews
  has_one :cuisine
  has_many :reviews
end

