require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let!(:orders) { create_list(:order, 10, user_id: user.id, product_id: product.id) }
  let(:order_id) { orders.first.id }

  # Test suite for GET /orders
  describe 'GET /orders' do
    # make HTTP get request before each example
    before { get '/api/v1/orders', params: {} }

    it 'returns orders' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /orders/:id' do

    before { get "/api/v1/orders/#{order_id}", params: {} }

    context 'when the record exists' do
      it 'returns the order' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end

  describe 'POST /orders' do

    let(:valid_attributes) { { status: 'ordered',
                               total: 10.0,
                               user_id: user.id,
                               product_id: product.id
                              } }

    context 'when the request is valid' do
      before { post '/api/v1/orders', params: valid_attributes }

      it 'creates a order' do
        json = JSON.parse(response.body)
        expect(json['status']).to eq('ordered')
        expect(json['total']).to eq("10.0")
        expect(json['user_id']).to eq(user.id)
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do
      before { post '/api/v1/orders', params: { status: 'ordered', total: 10.0 } }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

    end

  end

  describe 'PUT /orders/:id' do

    let(:valid_attributes) { { status: 'ordered',
                               total: 10.0,
                               user_id: user.id,
                               product_id: product.id
                              } }

    context 'when the record exists' do
      before { put "/api/v1/orders/#{order_id}", params: valid_attributes }

      it 'updates the record' do
        json = JSON.parse(response.body)
        expect(json['status']).to eq('ordered')
        expect(json['total']).to eq("10.0")
        expect(json['user_id']).to eq(user.id)
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end

  describe 'DELETE /orders/:id' do

    before { delete "/api/v1/orders/#{order_id}", params: {} }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

end
