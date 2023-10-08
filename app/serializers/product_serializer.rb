class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :created_at, :updated_at, :title, :description, :price

  attribute :categories do |object|
    object.categories.map do |category|
      CategorySerializer.new(category)
    end
  end    
end
