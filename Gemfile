source 'https://rubygems.org'

# because hyrax is in git, we can't load it in the gemspec
# gem 'git'
# gem 'hyrax', '1.0.0.rc1', github: 'projecthydra-labs/hyrax'

# Specify your gem's dependencies in dog_biscuits.gemspec
gemspec

group :development, :test do
  # current hyrax seems to require rails 5.0.0.1 (etc.)
  # if you get an error when running tests, run with bundle exec:
  #   bundle exec rspec (if using rubymine or intellij this can be set in edit configurations 'bundler')
  # gem 'rails', '5.0.0.1'
  # gem 'activesupport', '5.0.0.1'
  # gem 'actionpack', '5.0.0.1'
  # gem 'activejob', '5.0.0.1'
  # gem 'activemodel', '5.0.0.1'
  # gem 'activerecord', '5.0.0.1'
  # gem 'railties', '5.0.0.1'

  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'simplecov', :require => false, :group => :test
end
# BEGIN ENGINE_CART BLOCK
# engine_cart: 1.1.0
# engine_cart stanza: 0.10.0
# the below comes from engine_cart, a gem used to test this Rails engine gem in the context of a Rails app.
file = File.expand_path('Gemfile', ENV['ENGINE_CART_DESTINATION'] || ENV['RAILS_ROOT'] || File.expand_path('.internal_test_app', File.dirname(__FILE__)))
if File.exist?(file)
  begin
    eval_gemfile file
  rescue Bundler::GemfileError => e
    Bundler.ui.warn '[EngineCart] Skipping Rails application dependencies:'
    Bundler.ui.warn e.message
  end
else
  Bundler.ui.warn "[EngineCart] Unable to find test application dependencies in #{file}, using placeholder dependencies"

  if ENV['RAILS_VERSION']
    if ENV['RAILS_VERSION'] == 'edge'
      gem 'rails', github: 'rails/rails'
      ENV['ENGINE_CART_RAILS_OPTIONS'] = '--edge --skip-turbolinks'
    else
      gem 'rails', ENV['RAILS_VERSION']
    end
  end

  case ENV['RAILS_VERSION']
  when /^4.2/
    gem 'responders', '~> 2.0'
    gem 'sass-rails', '>= 5.0'
    gem 'coffee-rails', '~> 4.1.0'
  when /^4.[01]/
    gem 'sass-rails', '< 5.0'
  end
end
# END ENGINE_CART BLOCK