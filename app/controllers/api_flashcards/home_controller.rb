require_dependency 'api_flashcards/application_controller'
# File for ApiFlashcards::HomeController
module ApiFlashcards
  # File for ApiFlashcards::HomeController
  class HomeController < ApplicationController
    before_action :authenticate

    def index; end
  end
end
