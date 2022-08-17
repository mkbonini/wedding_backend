require 'rails_helper'

RSpec.describe "Loggings", type: :request do
  let!(:loggings) { create_list(:logging, 10) }
  let(:logging_id) { loggings.first.id }

  describe 'GET /loggings' do
    before { get '/loggings' }

    it 'returns loggings' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /logging/:id' do
    before { get "/loggings/#{logging_id}" }

    context 'when the record exists' do
      it 'returns the logging' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(logging_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:logging_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe 'POST /loggings' do
    let(:valid_attributes) { { name: 'Hummingbird', capacity: 6, type: 'coed', url: 'website.com', description: 'words are here' } }

    context 'when the request is valid' do
      before { post '/loggings', params: valid_attributes }

      it 'creates a todo' do
        expect(json['name']).to eq('Hummingbird')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/logging', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  describe 'PUT /loggings/:id' do
    let(:valid_attributes) { { name: 'Hummingbird' } }

    context 'when the record exists' do
      before { put "/loggings/#{logging_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /logging/:id' do
    before { delete "/logging/#{logging_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
