FactoryGirl.define do
  factory :card, class: ApiFlashcards::Card do
    original_text 'дом'
    translated_text 'house'
  end
end
