require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'rspec'
require 'rbconfig'
require 'savon'
require 'date'
require 'data_magic'
require 'faraday'
require 'watir-scroll'
require 'fastimage'
require 'base64'
require 'headless'
require 'clipboard'
require 'nokogiri'
require 'net/http'
require 'tiny_tds'
require 'os'
require 'watir-webdriver-performance'
require 'winrm'
require 'mimemagic'
require 'active_support'
require 'active_support/core_ext'
require 'net/ssh'

World(PageObject::PageFactory)
# Dir[File.dirname(__FILE__) + '/../support/*.rb'].each do |file|
#   require File.expand_path(file).gsub(/\.rb/,'')
# end
