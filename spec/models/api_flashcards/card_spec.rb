require 'rails_helper'

module ApiFlashcards
  RSpec.describe Card, type: :model do
    before :each do
      @card = create(:card)
    end

    it 'review_date_as_now OK' do
      expect(@card.review_date.strftime('%Y-%m-%d %H:%M')).to eq(Time.zone.now.strftime('%Y-%m-%d %H:%M'))
    end

    it 'validate that texts are not equal' do
      @card.update_attribute(:original_text, 'house')
      expect(@card.errors[:original_text]).to include
      'Вводимые значения должны отличаться.'
    end
  end
end
