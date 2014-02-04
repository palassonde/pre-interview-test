# Name : IMDB_request
# Description : A script that fetches information from the IMDB api
# Author : Pierre-Alexandre Lassonde
# Date : 3/02/14

require "net/http"
require "uri"
require 'rubygems'
require 'json'
require 'pp'

# My tools
name = ARGV.first
type = "&type=json"
url = "http://deanclatworthy.com/imdb/?q="

# Getting info from the interwebs
uri = URI.parse(url << name << type)
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
data = http.request(request)

# Parsing data
info = JSON.parse(data.body)
title = "N/A"
year = "N/A"

unless info['title'].nil?
  title = info['title']
end

unless info['year'].nil?
  year = info['year']
end

# Display
puts "Title: " << title
puts "Year: " << year