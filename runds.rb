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

Capybara.app_host = "http://localhost"
visit('/1.jpg')
open_new_window
page.driver.browser.aciton.send_keys(:f11).perform
p windows
#binding.pry
#switch_to_window(page.driver.browser.window_handles.last)
#visit('http://localhost/2.jpg')
within_window(windows.last) do
  visit('http://localhost/2.jpg')
end
sleep 3
within_window(windows.first) do
  page.all('html').execute_script('window.focus()')
end
sleep 3
page.driver.browser.action.send_keys(:alt,:tab).perform
sleep 3
page.driver.browser.action.send_keys(:alt,:tab).perform
sleep 3
page.driver.browser.action.send_keys(:alt,:tab).perform
sleep 3
binding.pry
page.driver.browser.action.send_keys(:alt,:tab).perform
#binding.pry

