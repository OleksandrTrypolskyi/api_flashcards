# File for ApiFlashcards::Card class
module ApiFlashcards
  class Card < ApplicationRecord
    validates :original_text, :translated_text, presence: true
    before_create :review_date_as_now, on: :create
    validate :texts_are_not_equal

    private

    def review_date_as_now
      self.review_date = Time.now
    end

    def texts_are_not_equal
      return unless full_downcase(original_text) == full_downcase(translated_text)
      errors.add(:original_text, 'Вводимые значения должны отличаться.')
    end

    def full_downcase(str)
      str.mb_chars.downcase.to_s.squeeze(' ').lstrip
    end
  end
end
