# File for ApiFlashcards::ApplicationController class
module ApiFlashcards
  # File for ApiFlashcards::ApplicationController class
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def json_response(object, status = :ok)
      render json: object, status: status
    end

    private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == 'password'
      end
    end
  end
end
