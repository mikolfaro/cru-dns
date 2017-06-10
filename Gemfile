source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'annotate'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap-sass', '~> 3.3.6'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'execjs'

gem 'font-awesome-rails'

gem 'haml'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use jdbcsqlite3 as the database for Active Record
gem 'pg'
gem 'puma'

gem 'rails', '~> 5.0'
gem 'redis-objects'
gem 'redis-rails', '~> 5.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Use Unicorn as the app server
# gem 'unicorn'

group :development, :test do
  gem 'factory_girl_rails'

  gem 'pry'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
end
