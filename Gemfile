source 'https://rubygems.org'
ruby '2.1.1'
#Railsチュートリアル リスト3.1をベースとしている
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.1.0'
gem 'bootstrap-sass', '~> 3.2'
gem 'sprockets', '~>2.11'
gem 'sass-rails', '~>4.0.2'
gem 'uglifier', '~>2.1'
gem 'coffee-rails', '~>4.0'
gem 'jquery-rails', '~>3.0'
gem 'turbolinks', '~>1.1'
gem 'jbuilder', '~>1.0'

# 認証機能追加
gem 'devise', '~>3.2'

# 記事収集機能
gem 'feedjira', '~> 1.3'

group :development, :test do
  gem 'sqlite3', '~>1.3'
  gem 'faker',  '~>1.4'
end

group :test do
  gem 'selenium-webdriver', '~>2.35'
  gem 'rspec-rails', '~>2.13'
  gem 'capybara', '~>2.1'
  gem 'factory_girl_rails', '~>4.2'
end

group :doc do
  gem 'sdoc', '~>0.3', require: false
end

group :production do
  gem 'pg', '~>0.15'
  gem 'rails_12factor', '~>0.0.2'
end