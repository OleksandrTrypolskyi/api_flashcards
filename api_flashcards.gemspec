$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'api_flashcards/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'api_flashcards'
  s.version     = ApiFlashcards::VERSION
  s.authors     = ['TrypolskyiS']
  s.email       = ['tripolskys@gmail.com']
  s.homepage    = 'https://github.com/TrypolskyiS/api_flashcards'
  s.summary     = 'Summary'
  s.description = 'Description'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.1'

  s.add_development_dependency 'sqlite3'
end
