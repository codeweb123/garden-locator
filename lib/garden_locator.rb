require_relative "./garden_locator/version"
require_relative "./garden_locator/cli"
require_relative "./garden_locator/scraper"
require_relative "./garden_locator/garden"

require 'pry'
require 'nokogiri'
require 'open-uri'

module GardenLocator
    class Error < StandardError; end
end