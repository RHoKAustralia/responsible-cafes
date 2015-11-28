source 'https://rubygems.org'

gem 'rails', '3.2.18'

gem 'thin'

gem 'mongoid', '~> 3.0'
gem 'bson_ext', '~> 1.5'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'twitter-bootstrap-rails'
  gem 'jquery-ui-rails'
  gem 'jquery-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

# Authentication and Access control
# ==================================
gem 'devise' # Authentication
gem 'cancan' # Access control
gem 'role_model' # User roles
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

# Misc
# ====
gem 'acts_as_api' # Custom API response formats
gem 'enumerize'
gem 'simple_form' # Easy to create forms
gem 'simple-navigation' # Tabs/navigation
gem 'mongoid_taggable' # Tags
gem 'mongoid_slug' # Friendly urls
gem 'kaminari' # Pagination
gem 'aws-ses', '~> 0.4.4', :require => 'aws/ses' # Transactional emails
gem 'js-routes'
gem "asset_sync" # Sync assets with S3
gem 'mongoid_rails_migrations'
gem "koala" # Facebook
# gem "cocoon" # nested forms
# gem 'bootstrap-wysihtml5-rails' # wysiwyg editor

# File handling
# ==============
gem 'carrierwave' # Uploads
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'carrierwave_direct' # Direct uploads to S3
gem 'mini_magick'
gem 'fog'

# Development and Test environments
# ==================================
group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'ruby_gntp'
  gem 'rspec-rails'
  gem 'foreman'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'heroku'
  gem 'debugger'
  gem 'quiet_assets' # Stop logging of asset requests
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
