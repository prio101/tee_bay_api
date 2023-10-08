class RentSerializer
  include JSONAPI::Serializer
  attributes :id, :price, :created_at, :updated_at, :start_date, :end_date, :status, :product_id

  attribute :user do |object|
    object.user.email
  end
end
