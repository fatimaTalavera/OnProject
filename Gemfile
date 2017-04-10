source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.2.6'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 3.1.4'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'coffee-script-source','1.8.0'
gem 'nested_form'
gem 'kaminari'
gem 'ransack'
gem 'slim'
gem 'carrierwave'
gem 'cloudinary'
gem 'cancan'
gem 'ruby-enum'
gem "mini_magick"
group :development, :test do
  gem 'byebug', platform: :mri
end
group :development do
  gem 'fog'
  gem 'web-console', '>= 3.3.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'high_voltage'
gem 'pg'
gem "breadcrumbs_on_rails"
# gem para validaciones
gem 'client_side_validations'
gem 'rails_best_practices'
gem "rubycritic", :require => false
# gem para mascara en los inputs
gem 'maskedinput-rails'
group :development do
  gem 'better_errors'
  gem 'rails_apps_pages'
  gem 'rails_layout'
  gem 'brakeman', :require => false
end
