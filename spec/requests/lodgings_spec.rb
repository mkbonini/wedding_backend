require 'rails_helper'

RSpec.describe "Lodgings", type: :request do
  let!(:lodgings) { create_list(:lodging, 10) }
  let(:lodging_id) { lodgings.first.id }

  describe 'GET /lodgings' do
    before { get '/lodgings' }

    it 'returns lodgings' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /lodging/:id' do
    before { get "/lodgings/#{lodging_id}" }

    context 'when the record exists' do
      it 'returns the lodging' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(lodging_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:lodging_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Lodging/)
      end
    end
  end

  describe 'POST /lodgings' do
    let(:valid_attributes) { { name: 'Hummingbird', capacity: 6, lodging_type: 'coed', url: 'website.com', description: 'words are here' } }

    context 'when the request is valid' do
      before { post '/lodgings', params: valid_attributes }

      it 'creates a todo' do
        expect(json['name']).to eq('Hummingbird')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/lodgings', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Lodging type can't be blank, Capacity can't be blank, Url can't be blank, Description can't be blank/)
      end
    end
  end

  describe 'PUT /lodgings/:id' do
    let(:valid_attributes) { { name: 'Hummingbird' } }

    context 'when the record exists' do
      before { put "/lodgings/#{lodging_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /lodging/:id' do
    before { delete "/lodgings/#{lodging_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
