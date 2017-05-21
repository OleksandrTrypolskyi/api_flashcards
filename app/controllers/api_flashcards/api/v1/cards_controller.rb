require_dependency 'api_flashcards/application_controller'

module ApiFlashcards
  class Api::V1::CardsController < ApplicationController
    def index
      @cards = Card.all
      json_response(@cards)
    end

    def create
      # @card = Card.create(card_params)
      # if @card.save
      #   json_response(@card, :created)
      # else
      #   json_response(@card.errors, :unprocessable_entity)
      # end
      @card = Card.create!(card_params)
      json_response(@card, :created)
    rescue ActiveRecord::RecordInvalid => e
      json_response({ message: e.message }, :unprocessable_entity)
    end

    def show
      @card = Card.find(params[:id])
      json_response(@card)
    rescue ActiveRecord::RecordNotFound => e
      json_response({ message: e.message }, :not_found)
    end

    def review_card
      @card = Card.find(params[:id])
      @translation = params[:translation]
      if @card.translated_text == @translation
        json_response({ message: 'correct' }, :ok)
      else
        json_response({ message: 'incorrect' }, :non_authoritative_information)
      end
    end

    private

    def card_params
      params.permit(:original_text, :translated_text, :review_date)
    end
  end
end
