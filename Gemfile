source 'http://rubygems.org'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql'
gem 'sqlite3'
gem 'spree', :git => 'git://github.com/spree/spree.git'
#gem 'spree', :path => '../spree'
gem 'aws-s3'
gem 'jammit', '0.6.0'

gem 'spree_recently_viewed', :git => 'git://github.com/jzw/spree_recently_viewed.git'
#disabling advanced_reporting as searchlogic is now removed
#gem 'advanced_reporting', :git => 'git://github.com/neerajdotname/spree-advanced-reporting', :branch => 'rails3'
gem 'spree_email_to_friend'
gem 'spree_related_products', :git => 'git://github.com/spree/spree_related_products.git'
gem 'spree_social', :git => 'git://github.com/spree/spree_social.git'
gem 'spree_wishlist', :git => 'git://github.com/spree/spree_wishlist.git', :branch => 'rails3'
gem 'spree_static_content', :git => 'git://github.com/spree/spree_static_content.git'
gem 'spree_editor', :git => 'git://github.com/divineforest/spree_editor.git'
gem 'spree_active_shipping', :git => 'git://github.com/spree/spree_active_shipping.git'
gem 'spree_paypal_express', :git => 'git://github.com/spree/spree_paypal_express.git'
#gem 'spree_paypal_express', :path => '../spree_paypal_express'

gem 'hoe', '2.8.0' #prevents requirement of rubygem 1.4.0 - which is not supported by heroku


# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
 gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end


group :development, :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  #gem 'shoulda'
  gem "rspec-rails", ">= 2.0.1"
  gem "cucumber-rails", ">= 0.3.2"
  gem "capybara", "= 0.4.0"
  gem "launchy", ">= 0.3.7"
end

