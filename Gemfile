source 'http://rubygems.org'

gem 'rails'

gem "mongoid"
gem "bson_ext"

gem 'sorcery'

gem 'uglifier'

gem 'database_cleaner'
gem 'mongoid_search'

gem 'forgery'
gem 'fabrication'

gem 'cells'
# gem 'apotomo', git: 'git://github.com/apotonick/apotomo.git'
gem 'apotomo', git: 'git://github.com/Nerian/apotomo.git', :branch => 'patch-4'

gem 'bootstrap-datepicker-rails'
gem 'font-awesome-rails'

gem 'thin'

gem 'i18n-inflector-rails'

group :production do
  gem 'dalli'
end

group :assets do
  gem 'sass-rails'  
  gem 'formtastic', git: 'git://github.com/justinfrench/formtastic.git', branch: '2.1-stable'
  gem 'formtastic-bootstrap', git: 'git://github.com/cgunther/formtastic-bootstrap.git', branch: 'bootstrap2-rails3-2-formtastic-2-1'
  gem 'anjlab-bootstrap-rails', '>= 2.0', :require => 'bootstrap-rails'
  gem "slim-rails"
  gem 'kaminari'
  gem 'jquery-rails'
  gem 'coffee-rails'
  gem 'pjax_rails', git: 'git://github.com/rails/pjax_rails.git'
end

group :test, :development do
  gem 'mongoid-rspec'
  gem 'ruby_gntp'
  gem 'rspec'
  gem "rspec-rails"
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'guard-spork'
  gem 'spork', '~> 0.9.0.rc'
  gem 'heroku'
  gem 'guard-sprockets'
  gem "rspec-cells"
  gem "rspec-apotomo", git: 'git://github.com/apotonick/rspec-apotomo.git'
  gem 'powder'
end
