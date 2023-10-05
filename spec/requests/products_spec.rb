require 'rails_helper'

RSpec.describe Product, type: :request do

  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  # Test suite for GET /products
  describe 'GET /products' do
    # make HTTP get request before each example
    before { get '/api/v1/products', params: {} }

    it 'returns products' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products/:id' do

    before { get "/api/v1/products/#{product_id}", params: {} }

    context 'when the record exists' do
      it 'returns the product' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end

  describe 'POST /products' do

    let(:valid_attributes) { { title: 'test', description: 'test', price: 10.0 } }

    context 'when the request is valid' do
      before { post '/api/v1/products', params: valid_attributes }

      it 'creates a product' do
        json = JSON.parse(response.body)
        expect(json['title']).to eq('test')
        expect(json['description']).to eq('test')
        expect(json['price']).to eq("10.0")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end
  end

  describe 'PUT /products/:id' do
    let(:valid_attributes) { { title: 'test', description: 'test', price: 10.0 } }

    context 'when the record exists' do
      before { put "/api/v1/products/#{product_id}", params: valid_attributes }

      it 'updates the record' do
        json = JSON.parse(response.body)
        expect(json['title']).to eq('test')
        expect(json['description']).to eq('test')
        expect(json['price']).to eq("10.0")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end


  describe 'DELETE /products/:id' do
    

end
