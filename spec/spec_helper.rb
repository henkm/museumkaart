require "bundler"
Bundler.setup(:default, :development)

# require 'simplecov'
# require 'coveralls'

# Coveralls.wear!
# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# SimpleCov.start

require 'rubygems'
require 'bundler/setup'
require 'vcr'
require 'cgi'
require 'museumkaart'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :fakeweb
  c.register_request_matcher :ignore_query_param_ordering do |r1, r2|
    uri1 = URI(r1.uri)
    uri2 = URI(r2.uri)

    uri1.scheme == uri2.scheme &&
      uri1.host == uri2.host &&
        uri1.path == uri2.path &&
          CGI.parse(uri1.query) == CGI.parse(uri2.query)
  end
end

RSpec.configure do |config|
  config.order = "random"
  # config.filter_run :focus => true
end