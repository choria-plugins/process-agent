source "https://rubygems.org"

group :test do
  # Pin json for Ruby < 2.0.0
  gem "json"
  gem "mcollective-test"
  gem "mocha"
  gem "rake"
  gem "rspec"
  gem "rubocop", "0.51.0"
  gem "sys-proctable"
end

mcollective_version = ENV["MCOLLECTIVE_GEM_VERSION"]

if mcollective_version
  gem "mcollective-client", mcollective_version, :require => false
else
  gem "mcollective-client", :require => false # rubocop:disable Bundler/DuplicatedGem
end
