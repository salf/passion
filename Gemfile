source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg',    '~> 0.21'
gem 'puma',  '~> 3.7'
gem 'active_model_serializers', '~> 0.10.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'omniauth-google-oauth2', '~> 0.5.2'
gem 'rack-cors', '~> 1.0.2'
gem 'bcrypt'

group :development, :test do
  gem 'annotate',          '~> 2.7.2'
  gem 'pry',               '~> 0.11.3'
  gem 'rspec-rails',       '~> 3.7.2'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker',             '~> 1.8.5'
  gem 'shoulda-matchers',  '~> 3.1.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
