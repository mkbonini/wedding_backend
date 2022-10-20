require 'rails_helper'

RSpec.describe "Guests", type: :request do
  let!(:lodging) { create(:lodging) }
  let!(:team) { create(:team) }
  let!(:guests) { create_list(:guest, 10, lodging_id: lodging.id, team_id: team.id) }
  let(:lodging_id) { lodging.id }
  let(:team_id) { team.id }
  let(:guest_id) { guests.first.id }

  describe 'GET /guests' do
    before { get '/guests' }

    it 'returns guests' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /guest/:id' do
    before { get "/guests/#{guest_id}" }

    context 'when the record exists' do
      it 'returns the guest' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(guest_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:guest_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Guest/)
      end
    end
  end

  describe 'POST /guests' do
    let(:valid_attributes) { { first_name: 'Miwha', last_name: 'Geschwind', rsvp: 'yes', type: 'coed', email: 'name@website.com', diet: 'words are here', meals: "test", payment_method: 1, arrival_date: 'friday', party_count: 1, plus_one_count: 0, comments: "words here", team_id: team_id, lodging_id: lodging_id } }

    context 'when the request is valid' do
      before { post '/guests', params: valid_attributes }

      it 'creates a guest' do
        expect(json['first_name']).to eq('Miwha')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/guests', params: { first_name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Lodging must exist, Team must exist, Last name can't be blank, Email can't be blank, Rsvp can't be blank, Diet can't be blank, Meals can't be blank, Payment method can't be blank, Arrival date can't be blank, Party count can't be blank, Plus one count can't be blank, Comments can't be blank/)
      end
    end
  end

  describe 'PUT /guests/:id' do
    let(:valid_attributes) { { first_name: 'Hummingbird', email: 'mikemiwha@gmail.com' } }

    context 'when the record exists' do
      before { put "/guests/#{guest_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /guest/:id' do
    before { delete "/guests/#{guest_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
