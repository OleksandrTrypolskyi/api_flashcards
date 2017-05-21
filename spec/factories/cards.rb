FactoryGirl.define do
  factory :card, class: ApiFlashcards::Card do
    original_text 'дом'
    translated_text 'house'
    interval 1
    repeat 1
    efactor 2.5
    quality 5
    attempt 1
  end
end
