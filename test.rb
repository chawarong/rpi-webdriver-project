#!/usr/bin/env ruby
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'net/http'
require 'rspec/expectations'
#require 'pry'

include Capybara::DSL
#include RSpec::Matchers

Capybara.register_driver :selenium_firefox do |app|
  #args = %w(-P default) 
  # --user-data-dir=/Users/songserm/Library/Application\ Support/Google/Chrome
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => 'default')
end

Capybara.run_server = false
Capybara.default_driver = :selenium_firefox

#Capybara.app_host = "http://www.yahoo.com"
#visit('/')
#sleep 5
#click_link_or_button 'Parenting'
#sleep 10
#click_link_or_button 'Mobile'
#sleep 10
#click_link_or_button 'Games'
#sleep 10
#click_link_or_button 'Weather'
#sleep 10

Capybara.app_host = "http://192.168.1.xxx"
visit('/PC')
sleep 10 
fill_in 'user', :with => "xxx"
fill_in 'password', :with => "xxx" 

click_link_or_button('Login')
#binding.pry
sleep 10 
#page.all('html').execute_script("document.body.style.transform='scale(2.0)';")
#page.driver.browser.action.key_down(:control).send_keys("+").perform
#sleep 1
#page.driver.browser.action.key_down(:control).send_keys("+").perform
#sleep 1
#page.driver.browser.action.key_down(:control).send_keys("+").perform
#sleep 1
page.all('html').execute_script("$('td').css('font-size','30px');")
page.all('html').execute_script("$('p').css('font-size','30px');")
page.all('html').execute_script("$('strong').css('font-size','40px');")
page.all('html').execute_script("$('strong').css('font-color','red');")

loop do
  sleep 10
  find('h3#ui-accordion-accordion-header-1').click
  sleep 10
  find('h3#ui-accordion-accordion-header-2').click
  sleep 10
  find('h3#ui-accordion-accordion-header-3').click
  sleep 10
  find('h3#ui-accordion-accordion-header-0').click
end

