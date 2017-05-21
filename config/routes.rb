ApiFlashcards::Engine.routes.draw do
  root to: 'home#index'

  namespace :api, defaulats: { format: :json } do
    namespace :v1 do
      resources :cards, only: [ :index, :create, :show ]
      put 'cards/review_card',
          to: 'cards#review_card', as: 'review_card'
    end
  end
end
