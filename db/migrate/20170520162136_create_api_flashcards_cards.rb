class CreateApiFlashcardsCards < ActiveRecord::Migration[5.0]
  def change
    create_table :api_flashcards_cards do |t|
      t.string :original_text
      t.string :translated_text
      t.datetime :review_date, null: :false

      t.timestamps
    end
  end
end
