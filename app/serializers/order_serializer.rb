class OrderSerializer
  include JSONAPI::Serializer
  attributes :id, :total, :status

  attribute :product do |object|
    ProductSerializer.new(object.product)
  end

  attribute :user do |object|
    object.user.email
  end
end
