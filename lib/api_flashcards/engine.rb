# File for ApiFlashcards::Engine
module ApiFlashcards
  # File for ApiFlashcards::Engine
  class Engine < ::Rails::Engine
    isolate_namespace ApiFlashcards

    config.generators do |g|
      g.test_framework :rspec, fixture: true
    end
  end
end
