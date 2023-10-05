require 'rails_helper'

RSpec.describe 'Roles API', type: :request do
  let!(:roles) { create_list(:role, 10) }
  let(:role_id) { roles.first.id }

  # Test suite for GET /roles
  describe 'GET /roles' do
    # make HTTP get request before each example
    before { get '/api/v1/roles', params: {} }

    it 'returns roles' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /roles/:id' do

    before { get "/api/v1/roles/#{role_id}", params: {} }

    context 'when the record exists' do
      it 'returns the role' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(role_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end

  describe 'POST /roles' do

    let(:valid_attributes) { { name: 'admin', value: 'admin' } }

    context 'when the request is valid' do
      before { post '/api/v1/roles', params: valid_attributes }

      it 'creates a role' do
        json = JSON.parse(response.body)
        expect(json['name']).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end
  end

  describe 'PUT /roles/:id' do
    let(:valid_attributes) { { name: 'admin',value: 'admin'
                              } }

    context 'when the record exists' do
      before { put "/api/v1/roles/#{role_id}", params: valid_attributes }

      it 'updates the record' do
        json = JSON.parse(response.body)
        expect(json['name']).to eq('admin')
      end

      it 'returns status code 200' do

        expect(response).to have_http_status(200)
      end

    end

  end

  describe 'DELETE /roles/:id' do

    before { delete "/api/v1/roles/#{role_id}", params: {} }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

end
