#!/usr/bin/env ruby
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'net/http'
require 'rspec/expectations'
require 'pry'

include Capybara::DSL
#include RSpec::Matchers

Capybara.register_driver :selenium_firefox do |app|
  #args = %w(-P default) 
  # --user-data-dir=/Users/songserm/Library/Application\ Support/Google/Chrome
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => 'default')
end

Capybara.run_server = false
Capybara.default_driver = :selenium_firefox
sltime = 5
Capybara.app_host = "http://localhost"
loop do
  visit('http://localhost/1.html')
  sleep sltime
  visit('http://localhost/2.html')
  sleep sltime
  visit('http://localhost/3.html')
  sleep sltime
  visit('http://localhost/4.html')
  sleep sltime
end
#binding.pry

