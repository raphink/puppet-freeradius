source 'https://rubygems.org'

group :development, :unit_tests do
  gem 'puppetlabs_spec_helper', :require => false
  gem 'rspec-puppet',
                                :github  => 'rodjek/rspec-puppet',
                                :require => false
  
  gem 'rspec-puppet-facts',     :require   => false
  gem 'github_readme_generator',
                                :github  => 'raphink/github-readme-generator',
                                :require => false
end

group :system_tests do
  gem 'beaker-rspec',           :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
