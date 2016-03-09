require 'json'
require 'pry'
require 'pp'

file = File.read('jsonfile.json')
data = JSON.parse(file)
pp data
