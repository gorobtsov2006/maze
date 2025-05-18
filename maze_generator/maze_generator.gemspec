# frozen_string_literal: true

require_relative 'lib/maze_generator/version'

Gem::Specification.new do |spec|
  spec.name = 'maze_generator'
  spec.version = MazeGenerator::VERSION
  spec.authors = ['SxnCHeZzz, Nekrasov932, gorobtsov2006']
  spec.email = ['128973490+SxnCHeZzz@users.noreply.github.com']

  spec.summary = 'TODO: Write a short summary, because RubyGems requires one.'
  spec.description = 'TODO: Write a longer description or delete this line.'
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL here."
  spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir['lib/**/*', 'README.md', 'LICENSE.txt', 'CHANGELOG.md', 'CODE_OF_CONDUCT.md']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'simplecov', '~> 0.22'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
