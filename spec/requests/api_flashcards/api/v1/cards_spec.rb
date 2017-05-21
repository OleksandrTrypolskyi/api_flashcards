require 'rails_helper'

RSpec.describe 'API::V1', type: :request do
  let!(:card) { create :card }

  describe 'GET /cards' do
    before { get '/api_flashcards/api/v1/cards' }

    it 'returns cards' do
      expect(json).not_to be_empty
    end
  end

  describe 'GET /cards/:id' do
    before { get "/api_flashcards/api/v1/cards/#{card.id}" }

    context 'when the card exists' do
      it 'returns the card' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(card.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the card does not exists' do
      before :each do
        card.id = 100
        get "/api_flashcards/api/v1/cards/#{card.id}"
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("Couldn't find")
      end
    end
  end

  describe 'POST /cards' do
    context 'when the request is valid' do
      before :each do
        post '/api_flashcards/api/v1/cards/', params: { original_text: 'card', translated_text: 'карточка' }
      end

      it 'creates a card' do
        expect(json['original_text']).to eq('card')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api_flashcards/api/v1/cards/', params: { original_text: 'card', translated_text: 'card' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure massage' do
        expect(response.body).to match('Вводимые значения должны отличаться.')
      end
    end
  end

  describe 'PUT /cards/review_card' do
    context 'when the request is valid' do
      before :each do
        put '/api_flashcards/api/v1/cards/review_card', params: { id: card.id,
                                                                  translation: 'house' }
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns message about correct review' do
        expect(response.body).to match('correct')
      end
    end

    context 'when the request is invalid' do
      before { put '/api_flashcards/api/v1/cards/review_card', params: { id: card.id, translation: 'card' } }

      it 'returns status code 203' do
        expect(response).to have_http_status(203)
      end

      it 'returns message about incorrect review' do
        expect(response.body).to match('incorrect')
      end
    end
  end
end
